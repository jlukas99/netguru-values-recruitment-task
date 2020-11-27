import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netguru_values/core/config/routes.dart';
import 'package:netguru_values/core/const/tags.dart';
import 'package:netguru_values/core/widgets/bottom_navigation_icon.dart';
import 'package:netguru_values/core/widgets/floating_action_button.dart';
import 'package:netguru_values/utils/colors.dart';
import 'package:netguru_values/views/main/main_view_animation.dart';
import 'main_view_controller.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state.index);
    if (state == AppLifecycleState.resumed) {
      Get.find<MainAnimationController>().controller.reset();
      await Future.delayed(Duration(seconds: 3));
      Get.find<MainAnimationController>().controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<MainController>(),
      builder: (controller) => Scaffold(
        appBar: _appBar(controller),
        bottomNavigationBar: _navigaton(),
        body: _body(controller),
      ),
    );
  }

  Widget _body(MainController controller) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
          child: Center(
            child: GetBuilder<MainAnimationController>(
                id: "body",
                init: Get.find<MainAnimationController>()
                    .initOffsetAnimation(this),
                builder: (animationController) {
                  return Transform.translate(
                    offset: animationController.animation.status ==
                            AnimationStatus.reverse
                        ? Offset(
                            (animationController.animation.value.dx *
                                Get.width),
                            0,
                          )
                        : Offset(
                            -(animationController.animation.value.dx *
                                Get.height),
                            0),
                    child: Obx(
                      () => AutoSizeText(
                        '“${controller.currentValue.value.text}“',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kalam(
                          color: Get.context.theme.textTheme.bodyText1.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                        maxFontSize: 32,
                      ),
                    ),
                  );
                }),
          ),
        ),
      );

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
                onTap: () async {
                  await Get.toNamed(RoutesName.VALUES);
                },
              ),
              CustomFloatingActionButton(() {}),
              BottomNavigationIcon(
                text: "favorites",
                icon: Icons.favorite_rounded,
                onTap: () async {
                  await Get.toNamed(RoutesName.FAVORITES);
                },
              ),
            ],
          ),
        ),
      );

  Widget _appBar(MainController controller) => PreferredSize(
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
                        text: 'values'.tr,
                        style: TextStyle(
                          color: Get.context.theme.textTheme.bodyText1.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  ),
                ),
                GetBuilder<MainAnimationController>(
                  id: "body",
                  builder: (animationController) {
                    return Transform.translate(
                      offset: Offset(
                          (animationController.animation.value.dx *
                              (Get.width * 0.3)),
                          0),
                      child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Obx(
                          () => Icon(
                            controller.currentValue.value.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: controller.currentValue.value.isFavorite
                                ? Get.theme.primaryColor
                                : Clr.icon,
                          ),
                        ),
                        onPressed: () => controller.setFavoriteForValue(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size(Get.width, 73),
      );
}
