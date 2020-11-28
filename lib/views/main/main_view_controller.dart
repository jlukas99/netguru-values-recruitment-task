import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../core/controllers/values_controller.dart';
import '../../core/models/value.dart';
import 'main_view_animation.dart';

class MainController extends GetxController {
  Rx<ValueModel> currentValue;

  ValuesController _valuesController = Get.find<ValuesController>();
  MainAnimationController _animation = Get.find<MainAnimationController>();

  List<int> _lastNumbers = [];

  bool isStopped = true;

  setRandomValue() async {
    isStopped = false;
    List<ValueModel> _values = _valuesController.getAllValues();
    int _max = _values.length;
    int _index = _max;

    print("MAX: $_max");

    if (_index > 0) {
      _index = Random().nextInt(_max);

      if (_lastNumbers.length >= _max) _lastNumbers.clear();

      while (_lastNumbers.contains(_index)) {
        _index = Random().nextInt(_max);
      }
    } else {
      isStopped = true;
      return currentValue.value = ValueModel(
        "Add your own value, clicking button below",
        isFavorite: null,
      );
    }

    _lastNumbers.add(_index);

    ValueModel value = _values[_index];
    currentValue.value = value;

    await Future.delayed(Duration(seconds: 5));
    if (_animation.controller != null &&
        (_animation.animation.status.index != 2))
      _animation.controller.forward();
  }

  setFavoriteForValue() async => currentValue.value =
      (await _valuesController.setFavoriteForValue(currentValue.value));

  @override
  void onInit() {
    currentValue = ValueModel(
      "Add your own value, clicking button below",
      isFavorite: null,
    ).obs;

    setRandomValue();

    super.onInit();
  }
}
