import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/modules/qr_scanner/controllers/qr_scanner_controller.dart';

class QrScannerView extends GetView<QrScannerController> {
  const QrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Obx(() {
        // Display scanned data if available
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
                    controller.clearScannedData();
                    controller.initializeCamera();
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
                  frameWidth: 500,
                  frameHeight: 500,
                  borderRadius: 12,
                  borderColor: Get.theme.colorScheme.primary,
                  borderWidth: 2,
                ),
              ),
            ),

            // Instructions
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Place QR code inside the frame to scan.\n'
                      'Please avoid shaking to get results quickly.',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

// Custom Painter for overlay
class QrScannerOverlayPainter extends CustomPainter {
  final double frameWidth;
  final double frameHeight;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  QrScannerOverlayPainter({
    required this.frameWidth,
    required this.frameHeight,
    required this.borderRadius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()..color = Colors.black.withOpacity(0.7);
    final clearPaint = Paint()..blendMode = BlendMode.clear;

    // Draw the black overlay
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), blackPaint);

    // Define the transparent cutout area
    final cutoutRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: frameWidth,
      height: frameHeight,
    );

    // Clear the cutout area
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.drawRRect(
      RRect.fromRectAndRadius(cutoutRect, Radius.circular(borderRadius)),
      clearPaint,
    );
    canvas.restore();

    // Draw the border around the cutout area
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(
      RRect.fromRectAndRadius(cutoutRect, Radius.circular(borderRadius)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

