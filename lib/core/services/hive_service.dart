import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/value.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    print("[Hive] initialize...");
    await Hive.initFlutter();

    print("[Hive] register adapters");
    Hive.registerAdapter(ValueAdapter());

    print("[Hive] service started...");
    return this;
  }
}
