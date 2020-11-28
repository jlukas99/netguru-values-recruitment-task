import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/value.dart';
import '../services/hive_service.dart';

class ValuesController extends GetxController {
  HiveService _hive = Get.find<HiveService>();

  List<ValueModel> getAllValues() => _hive.getHiveListValue();

  Future addNewValue(ValueModel value) async => await _hive.addNewValue(value);

  Future updateValue(ValueModel newValue, ValueModel oldValue) async =>
      await _hive.updateValue(newValue, oldValue);

  Future removeValue(ValueModel value) async => await _hive.removeValue(value);

  Future<ValueModel> setFavoriteForValue(ValueModel value) async {
    ValueModel newValue = ValueModel(value.text, isFavorite: !value.isFavorite);

    await updateValue(newValue, value);

    return newValue;
  }
}
