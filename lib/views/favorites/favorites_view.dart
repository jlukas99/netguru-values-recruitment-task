import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netguru_values/core/widgets/swipeable_card.dart';
import 'package:netguru_values/views/main/main_view_animation.dart';
import '../../core/const/tags.dart';
import '../../core/widgets/add_our_value_bottom_sheet.dart';
import '../../utils/colors.dart';

import 'favorites_view_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<FavoritesController>(),
      builder: (controller) => Scaffold(
        appBar: _appBar(controller),
        body: _body(controller, context),
      ),
    );
  }

  Widget _body(FavoritesController controller, BuildContext context) => Obx(
        () => controller.favoriteValues.isNullOrBlank
            ? SizedBox()
            : ListView.builder(
                itemCount: controller.favoriteValues.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (_, index) {
                  return SwipeableCard(
                    value: controller.favoriteValues[index],
                    index: index,
                    callback: (int type) {
                      switch (type) {
                        case 0:
                          return true;
                          break;
                        case 1:
                          return true;
                          break;
                        case 2:
                          return controller.favoriteValues.removeAt(index);
                          break;
                        case 3:
                          return controller.favoriteValues.removeAt(index);
                          break;
                      }
                    },
                  );
                },
              ),
      );

  Widget _appBar(FavoritesController controller) => PreferredSize(
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
                        text: "${'favorites'.tr} ",
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
                  onPressed: () async {
                    await Get.bottomSheet(
                      AddOurValueBottomSheet(favorite: true),
                      elevation: 6,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                    );

                    controller.getFavoriteValues();
                  },
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size(Get.width, 73),
      );
}
