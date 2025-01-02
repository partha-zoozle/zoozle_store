
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoozle_store/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
            animation: controller.animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    left: -controller.animation.value / 2,
                    bottom: -controller.animation.value / 2,
                    child: Container(
                      width: controller.animation.value,
                      height: controller.animation.value,
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(
                              controller.animation.value)),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      child: Image.asset(
                        'assets/images/zen_white.png',
                        width: Get.width * 0.5,
                        color: (controller.animation.value <
                            controller.animation.upperBound / 2)
                            ? Get.theme.primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
