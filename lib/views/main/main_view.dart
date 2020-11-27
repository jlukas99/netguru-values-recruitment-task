import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netguru_values/core/const/tags.dart';
import 'package:netguru_values/core/widgets/bottom_navigation_icon.dart';
import 'package:netguru_values/core/widgets/floating_action_button.dart';
import 'package:netguru_values/utils/colors.dart';
import 'main_view_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (_) => Scaffold(
        appBar: _appBar(),
        bottomNavigationBar: _navigaton(),
        body: _body(),
      ),
    );
  }

  //Body
  Widget _body() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Center(
            child: Obx(
              () => Text(
                '“${controller.currentValue.value.text}“',
                textAlign: TextAlign.center,
                style: GoogleFonts.kalam(
                  color: Get.context.theme.textTheme.bodyText1.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      );

  //Navigation
  Widget _navigaton() => SafeArea(
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavigationIcon(
                text: "values",
                icon: Icons.format_quote_rounded,
                onTap: () {},
              ),
              CustomFloatingActionButton(() {}),
              BottomNavigationIcon(
                text: "favorites",
                icon: Icons.favorite_rounded,
                onTap: () {},
              )
            ],
          ),
        ),
      );

  //Appbar
  Widget _appBar() => PreferredSize(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: HeroTag.SPLASH_NETGURU_VALUES,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Netguru | ",
                        style: TextStyle(
                          color: Get.context.theme.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'splash_values'.tr,
                        style: TextStyle(
                          color: Get.context.theme.textTheme.bodyText1.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Obx(
                    () => Icon(
                      controller.currentValue.value.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: Clr.icon,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size(Get.width, 73),
      );
}
