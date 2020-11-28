import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:netguru_values/core/const/tags.dart';
import 'package:netguru_values/utils/colors.dart';
import 'values_view_controller.dart';

class ValuesView extends GetView<ValuesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<ValuesController>(),
      builder: (controller) => Scaffold(
        appBar: _appBar(controller),
        // bottomNavigationBar: _navigaton(),
        // body: _body(controller),
      ),
    );
  }

  Widget _appBar(ValuesController controller) => PreferredSize(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Clr.icon,
                  ),
                  onPressed: () => Get.back(),
                ),
                Hero(
                  tag: HeroTag.SPLASH_NETGURU_VALUES,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "All ",
                        style: TextStyle(
                          color: Get.context.theme.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'values'.tr,
                        style: TextStyle(
                          color: Get.context.theme.textTheme.bodyText1.color,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.add_rounded,
                    color: Clr.icon,
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size(Get.width, 73),
      );
}
