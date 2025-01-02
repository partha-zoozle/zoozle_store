import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/routes/app_pages.dart';
import 'package:zoozle_store/app/widgets/zoozle_header.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZoozleHeader(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 196,
            height: 100,
            child: Container(
            decoration: BoxDecoration(
            color: Get.theme.colorScheme.primaryContainer, // Use theme color
              borderRadius: BorderRadius.circular(16), // Border radius
            ),
            padding: const EdgeInsets.all(16), // Add some padding
            child: const Column(
              mainAxisSize: MainAxisSize.min, // Adjust size to fit children
              children: [
                Text(
                  '10000',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Space between the texts
                Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
                ),
          ),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 196,
              height: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primaryContainer, // Use theme color
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
              padding: const EdgeInsets.all(16), // Add some padding
              child: const Column(
                children: [
                  Text(
                    '10000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8), // Space between the texts
                  Text(
                    'Users',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
          const SizedBox(height: 28,),
          SizedBox(
            width: 416,
            height: 56,
            child: FilledButton.icon(
              onPressed: () async {
                final result = await Get.toNamed(Routes.QR_SCANNER);
                if (result != null) {
                  Get.snackbar('QR Code Scanned', 'Data: $result',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              icon: const Icon(Icons.qr_code, color: Colors.white),
              label: const Text(
                'Scan QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
