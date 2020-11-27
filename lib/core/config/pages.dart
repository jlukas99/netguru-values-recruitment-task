import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:netguru_values/views/main/main_view_animation.dart';
import 'package:netguru_values/views/main/main_view_controller.dart';
import 'package:netguru_values/views/splash/splash_view_controller.dart';
import 'package:netguru_values/views/values/values_view_controller.dart';

import '../../views/favorites/favorites_view.dart';
import '../../views/main/main_view.dart';
import '../../views/splash/splash_view.dart';
import '../../views/values/values_view.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: RoutesName.SPLASH,
      page: () => SplashView(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: RoutesName.MAIN,
      page: () => MainView(),
      bindings: [
        BindingsBuilder.put(() => MainAnimationController()),
        BindingsBuilder.put(() => MainController()),
      ],
    ),
    GetPage(name: RoutesName.FAVORITES, page: () => FavoritesView()),
    GetPage(
      name: RoutesName.VALUES,
      page: () => ValuesView(),
      transition: Transition.fade,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 375),
      binding: BindingsBuilder.put(() => ValuesController()),
    ),
  ];
}
