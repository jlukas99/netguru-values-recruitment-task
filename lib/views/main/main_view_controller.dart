import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:netguru_values/core/models/value.dart';
import 'package:netguru_values/core/services/hive_service.dart';

class MainController extends GetxController {
  Rx<ValueModel> currentValue;

  Timer _timer;

  setRandomValue() {
    int _max = Get.find<HiveService>().getHiveListValue().length - 1;

    int _index = Random().nextInt(_max);

    ValueModel value = Get.find<HiveService>().getHiveListValue()[_index];
    currentValue.value = value;
  }

  @override
  void onInit() {
    currentValue = ValueModel("").obs;

    setRandomValue();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) => setRandomValue());

    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
