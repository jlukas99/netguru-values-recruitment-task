import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/const/tags.dart';
import 'splash_view_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        initState: (_) => controller.fakeAwait(),
        builder: (_) => Center(
          child: Hero(
            tag: HeroTag.SPLASH_NETGURU_VALUES,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${'netguru'.tr} | ",
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: 'values'.tr,
                  style: TextStyle(
                    color: context.theme.textTheme.bodyText1.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
