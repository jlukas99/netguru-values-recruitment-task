import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netguru_values/core/const/tags.dart';
import 'package:get/get.dart';
import 'main_view_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: HeroTag.SPLASH_NETGURU_VALUES,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Netguru | ",
              style: TextStyle(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: 'splash_values'.tr,
              style: TextStyle(
                color: context.theme.textTheme.bodyText1.color,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
