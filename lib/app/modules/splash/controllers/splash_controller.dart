import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/routes/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animation;

  @override
  void onInit() {
    var radius = sqrt(pow(Get.width, 2) + pow(Get.height, 2));
    animation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
        upperBound: radius * 2,
        lowerBound: 0);
    super.onInit();
    animation.animateTo(radius * 2);
    animation.addListener(() {
      if (animation.isCompleted == true) {
        Get.offNamed(Routes.HOME_PAGE, arguments: true);
      }
    });
  }


  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }

}

