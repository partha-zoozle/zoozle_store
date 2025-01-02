import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Example reactive variable
  final count = 0.obs;

  void increment() => count.value++;
}
