import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/routes/app_pages.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          FilledButton.icon(
            onPressed: () async {
              final result = await Get.toNamed(Routes.QR_SCANNER);
              if (result != null) {
                Get.snackbar('QR Code Scanned', 'Data: $result',
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            icon: const Icon(Icons.qr_code, color: Colors.white),
            label: const Text(
              'Scan Product',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to Dashboard!'),
      ),
    );
  }
}
