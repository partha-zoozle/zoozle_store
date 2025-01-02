import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_purchase_controller.dart';

class ProductPurchaseView extends GetView<ProductPurchaseController> {
  const ProductPurchaseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductPurchaseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductPurchaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
