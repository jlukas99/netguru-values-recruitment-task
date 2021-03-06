import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class SplashController extends GetxController {
  //Wait one second and change view to Main
  fakeAwait() async {
    await Future.delayed(Duration(seconds: 1));

    Get.offNamed(RoutesName.MAIN);
  }
}
