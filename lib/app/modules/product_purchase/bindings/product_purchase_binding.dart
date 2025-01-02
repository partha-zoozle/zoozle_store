import 'package:get/get.dart';

import '../controllers/product_purchase_controller.dart';

class ProductPurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPurchaseController>(
      () => ProductPurchaseController(),
    );
  }
}
