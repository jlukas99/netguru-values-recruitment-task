import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_view_controller.dart';

class MainAnimationController extends GetxController {
  AnimationController controller;
  Animation<Offset> animation;

  initOffsetAnimation(TickerProvider vsync) {
    if (controller != null) return;

    controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      reverseDuration: const Duration(seconds: 2),
      vsync: vsync,
    );

    final offsetAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.elasticIn,
    );

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0),
    ).animate(offsetAnimation)
      ..addListener(() {
        update(["body"]);
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          Get.find<MainController>().setRandomValue();
          controller.reverse();
        }
      });
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
