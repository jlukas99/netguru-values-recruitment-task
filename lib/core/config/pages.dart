import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:netguru_values/views/splash/splash_view_controller.dart';

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
    GetPage(name: RoutesName.MAIN, page: () => MainView()),
    GetPage(name: RoutesName.FAVORITES, page: () => FavoritesView()),
    GetPage(name: RoutesName.VALUES, page: () => ValuesView()),
  ];
}
