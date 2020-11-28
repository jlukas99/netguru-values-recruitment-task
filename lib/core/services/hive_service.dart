import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/default_values.dart';
import '../models/value.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    print("[Hive] initialize...");
    await Hive.initFlutter();

    print("[Hive] register adapters");
    Hive.registerAdapter(ValueModelAdapter());

    //Hive.deleteBoxFromDisk("values");

    print("[Hive] open boxes");
    await Hive.openBox("values");

    print("[Hive] check if box is new");
    if (checkIfBoxIsNew()) createBoxWithDefaultData();

    return this;
  }

  ///If box length is equal to 0 then return true and create box with default values
  bool checkIfBoxIsNew() => Hive.box("values").length == 0 ? true : false;

  //If box is new create him with default values
  createBoxWithDefaultData() => setHiveValue(
        Get.deviceLocale == Locale("pl", "PL")
            ? defaultValuePL
            : defaultValueEN,
      );

  Future<void> clearBox(String name) async => await Hive.box(name).clear();

  Future<void> setHiveValue(List<ValueModel> value) async =>
      await Hive.box('values').put('list', value);

  Future<void> addNewValue(ValueModel valueModel) async =>
      setHiveValue(getHiveListValue()..add(valueModel));

  Future<void> updateValue(
      ValueModel newValueModel, ValueModel oldValueModel) async {
    int index = getIndex(oldValueModel);

    await removeValue(oldValueModel);

    await setHiveValue(getHiveListValue()..insert(index, newValueModel));
  }

  Future<void> removeValue(ValueModel valueModel) async {
    if (getHiveListValue().length == 1) {
      setHiveValue(List<ValueModel>());
    } else {
      setHiveValue(getHiveListValue()..remove(valueModel));
    }
  }

  int getIndex(ValueModel valueModel) => getHiveListValue().indexOf(valueModel);

  List<ValueModel> getHiveListValue() {
    List<dynamic> _list = Hive.box('values').get('list');
    List<ValueModel> _values = List<ValueModel>();

    for (dynamic value in _list) {
      _values.add(value as ValueModel);
    }

    return _values;
  }
}
