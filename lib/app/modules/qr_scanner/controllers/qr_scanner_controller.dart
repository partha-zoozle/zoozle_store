import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScannerController extends GetxController {
  final scannedData = ''.obs;
  Rx<CameraController?> cameraController = Rxn();
  List<CameraDescription> cameras = [];
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool isProcessing = false;

  final Map<DeviceOrientation, int> _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  void clearScannedData() {
    scannedData.value = '';
    cameraController.value?.dispose();
    cameraController.value = null;
    startLiveFeed();
  }

  Future<void> initializeCamera() async {
    if (!await requestCameraPermission()) {
      print("Camera permission denied.");
      return;
    }

    try {
      cameras = await availableCameras();
      CameraDescription? rearCam = cameras.firstWhereOrNull(
          (camera) => camera.lensDirection == CameraLensDirection.back);

      if (rearCam == null) {
        print("No rear camera found!");
        return;
      }

      final controller = CameraController(
        rearCam,
        ResolutionPreset.veryHigh,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );

      await controller.initialize();
      cameraController.value = controller;
      startLiveFeed();
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> startLiveFeed() async {
    if (cameraController.value == null ||
        !cameraController.value!.value.isInitialized) {
      print("Camera not initialized.");
      return;
    }

    try {
      await cameraController.value?.startImageStream(_processCameraImage);
    } catch (e) {
      print("Error starting image stream: $e");
    }
  }

  void _processCameraImage(CameraImage image) {
    if (isProcessing)
      return; // Prevent processing multiple frames simultaneously
    isProcessing = true;

    final inputImage = _convertCameraImageToInputImage(image);
    if (inputImage == null) {
      print("Failed to convert CameraImage to InputImage.");
      isProcessing = false;
      return;
    }

    _processBarcodeImage(inputImage);
  }

  InputImage? _convertCameraImageToInputImage(CameraImage image) {
    if (cameraController.value == null) return null;

    final camera = cameras.firstWhereOrNull(
        (cam) => cam.lensDirection == CameraLensDirection.back);
    if (camera == null) return null;

    final sensorOrientation = camera.sensorOrientation;
    final rotation = _getRotation(sensorOrientation);

    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null) return null;

    final plane = image.planes.first;
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  Future<void> _processBarcodeImage(InputImage inputImage) async {
    try {
      final barcodes = await _barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        final barcodeValue = barcodes.first.rawValue;
        scannedData.value = barcodeValue ?? '';
        print("Barcode detected: $barcodeValue");
      } else {
        print("No barcodes detected.");
      }
    } catch (e) {
      print("Error processing image: $e");
    } finally {
      isProcessing = false;
    }
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  InputImageRotation? _getRotation(int sensorOrientation) {
    return InputImageRotationValue.fromRawValue(sensorOrientation);
  }

  void stopScanning() {
    cameraController.value?.stopImageStream();
    print("Image stream stopped.");
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    _barcodeScanner.close();
    super.onClose();
  }
}
