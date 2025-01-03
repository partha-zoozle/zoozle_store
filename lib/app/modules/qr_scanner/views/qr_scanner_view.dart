import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/modules/qr_scanner/controllers/qr_scanner_controller.dart';
import 'package:zoozle_store/app/routes/app_pages.dart';
import 'package:zoozle_store/app/widgets/zoozle_header.dart';

class QrScannerView extends GetView<QrScannerController> {
  const QrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZoozleHeader(
        needDivider: false,
      ),
      body: Obx(() {
        if (controller.scannedData.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scanned Data: ${controller.scannedData.value}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    /*controller.clearScannedData();
                    controller.initializeCamera();*/
                    Get.toNamed(Routes.PRODUCT_PURCHASE);
                  },
                  child: const Text('Refresh'),
                ),
              ],
            ),
          );
        }

        // Show loading indicator if camera is not initialized
        if (controller.cameraController.value == null ||
            !controller.cameraController.value!.value.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            // Camera Preview
            Positioned.fill(
              child: CameraPreview(controller.cameraController.value!),
            ),

            // Overlay with transparent center
            Positioned.fill(
              child: CustomPaint(
                painter: QrScannerOverlayPainter(
                  frameWidth: 400,
                  frameHeight: 400,
                  borderRadius: 40,
                  borderColor: Get.theme.colorScheme.primary,
                  borderWidth: 5.79,
                ),
              ),
            ),

            // Instructions
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Place QR code inside the frame to scan.\n'
                  'Please avoid shaking to get results quickly.',
                  textAlign: TextAlign.center,
                  style:
                      Get.textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class QrScannerOverlayPainter extends CustomPainter {
  final double frameWidth;
  final double frameHeight;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  QrScannerOverlayPainter({
    required this.frameWidth,
    required this.frameHeight,
    required this.borderColor,
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the black overlay covering the entire screen
    final blackPaint = Paint()..color = Colors.black.withOpacity(0.47);
    final clearPaint = Paint()..blendMode = BlendMode.clear;
    final cornerPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    // Draw black overlay covering the entire screen
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), blackPaint);

    // Define the rectangle for the QR scanning area (clear area)
    final cutoutRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: frameWidth,
      height: frameHeight,
    );

    // Clear the scanning area
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      blackPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(cutoutRect, Radius.circular(borderRadius)),
      clearPaint, // Clear area in the center
    );
    canvas.restore();

    // Draw rounded L-shaped corner borders
    final double cornerLength = 40.0; // Matches the radius

    // Top-left corner
    canvas.drawArc(
      Rect.fromCircle(center: cutoutRect.topLeft + Offset(cornerLength, cornerLength), radius: cornerLength),
      -pi,
      pi / 2,
      false,
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutoutRect.left + cornerLength, cutoutRect.top),
      Offset(cutoutRect.left + cornerLength + cornerLength, cutoutRect.top),
      cornerPaint,
    );

    // Top-right corner
    canvas.drawArc(
      Rect.fromCircle(center: cutoutRect.topRight + Offset(-cornerLength, cornerLength), radius: cornerLength),
      -pi / 2,
      pi / 2,
      false,
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutoutRect.right - cornerLength, cutoutRect.top),
      Offset(cutoutRect.right - cornerLength - cornerLength, cutoutRect.top),
      cornerPaint,
    );

    // Bottom-left corner
    canvas.drawArc(
      Rect.fromCircle(center: cutoutRect.bottomLeft + Offset(cornerLength, -cornerLength), radius: cornerLength),
      pi / 2,
      pi / 2,
      false,
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutoutRect.left + cornerLength, cutoutRect.bottom),
      Offset(cutoutRect.left + cornerLength + cornerLength, cutoutRect.bottom),
      cornerPaint,
    );

    // Bottom-right corner
    canvas.drawArc(
      Rect.fromCircle(center: cutoutRect.bottomRight + Offset(-cornerLength, -cornerLength), radius: cornerLength),
      0,
      pi / 2,
      false,
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutoutRect.right - cornerLength, cutoutRect.bottom),
      Offset(cutoutRect.right - cornerLength - cornerLength, cutoutRect.bottom),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}




