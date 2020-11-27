import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'splash_view_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Netguru | ",
            ),
          ]),
        ),
      ),
    );
  }
}
