import 'package:get/get.dart';
import 'hive_service.dart';

class Services {
  static initServices() async {
    print('[Services] starting services ...');

    await Get.putAsync(() => HiveService().init());

    print('[Services] All services started...');
  }
}
