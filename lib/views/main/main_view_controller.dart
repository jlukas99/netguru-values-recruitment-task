import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:netguru_values/core/models/value.dart';
import 'package:netguru_values/core/services/hive_service.dart';
import 'package:netguru_values/views/main/main_view_animation.dart';

class MainController extends GetxController {
  Rx<ValueModel> currentValue;

  HiveService hive = Get.find<HiveService>();
  MainAnimationController animation = Get.find<MainAnimationController>();
  Timer _timer;

  int lastNumber;

  setRandomValue() async {
    int _max = hive.getHiveListValue().length - 1;

    int _index = Random().nextInt(_max);

    while (lastNumber == _index) {
      _index = Random().nextInt(_max);
    }

    lastNumber = _index;

    ValueModel value = hive.getHiveListValue()[_index];
    currentValue.value = value;

    await Future.delayed(Duration(seconds: 5));
    if (animation.controller != null && (animation.animation.status.index != 2))
      animation.controller.forward();
  }

  setFavoriteForValue() {
    ValueModel newValue = ValueModel(currentValue.value.text,
        isFavorite: !currentValue.value.isFavorite);

    hive.updateValue(newValue, currentValue.value);

    currentValue.value = newValue;
  }

  @override
  void onInit() {
    currentValue = ValueModel("").obs;

    setRandomValue();

    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
