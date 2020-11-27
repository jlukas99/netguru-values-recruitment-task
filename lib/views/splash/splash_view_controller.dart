import 'package:get/get.dart';
import 'package:netguru_values/core/config/routes.dart';

class SplashController extends GetxController {
  fakeAwait() async {
    await Future.delayed(Duration(seconds: 1));

    Get.offNamed(RoutesName.MAIN);
  }
}
