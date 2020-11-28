import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:netguru_values/views/values/values_view_controller.dart';

import '../../views/favorites/favorites_view.dart';
import '../../views/favorites/favorites_view_controller.dart';
import '../../views/main/main_view.dart';
import '../../views/main/main_view_animation.dart';
import '../../views/main/main_view_controller.dart';
import '../../views/splash/splash_view.dart';
import '../../views/splash/splash_view_controller.dart';
import '../../views/values/values_view.dart';
import '../controllers/values_controller.dart';
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
        BindingsBuilder.put(() => ValuesController()),
        BindingsBuilder.put(() => MainAnimationController()),
        BindingsBuilder.put(() => MainController()),
      ],
    ),
    GetPage(
      name: RoutesName.FAVORITES,
      page: () => FavoritesView(),
      transition: Transition.fade,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 375),
      binding: BindingsBuilder.put(() => FavoritesController()),
    ),
    GetPage(
      name: RoutesName.VALUES,
      page: () => ValuesView(),
      transition: Transition.fade,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 375),
      binding: BindingsBuilder.put(() => AllValuesController()),
    ),
  ];
}
