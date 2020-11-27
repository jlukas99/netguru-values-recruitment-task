import 'package:get/get_navigation/src/routes/get_route.dart';
import 'routes.dart';
import '../../views/favorites/favorites_view.dart';
import '../../views/main/favorites_view.dart';
import '../../views/main/splash_view.dart';
import '../../views/values/values_view.dart';

class Pages {
  static final pages = [
    GetPage(name: RoutesName.SPLASH, page: () => SplashView()),
    GetPage(name: RoutesName.MAIN, page: () => MainView()),
    GetPage(name: RoutesName.FAVORITES, page: () => FavoritesView()),
    GetPage(name: RoutesName.VALUES, page: () => ValuesView()),
  ];
}
