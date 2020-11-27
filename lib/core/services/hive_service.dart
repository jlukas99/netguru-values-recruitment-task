import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netguru_values/core/data/default_values.dart';
import 'package:netguru_values/core/models/value.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    print("[Hive] initialize...");
    await Hive.initFlutter();

    print("[Hive] register adapters");
    Hive.registerAdapter(ValueModelAdapter());

    await Hive.deleteBoxFromDisk("values");

    print("[Hive] open boxes");
    await Hive.openBox("values");

    print("[Hive] check if box is new");
    if (checkIfBoxIsNew()) createBoxWithDefaultData();

    return this;
  }

  ///If box length is equal to 0 then return true and create box with default values
  bool checkIfBoxIsNew() => Hive.box("values").length == 0 ? true : false;

  //If box is new create him with default values
  createBoxWithDefaultData() => setHiveValue(defaultValue);

  Future<void> clearBox(String name) async => await Hive.box(name).clear();

  Future<void> setHiveValue(List<ValueModel> value) async =>
      await Hive.box('values').put('list', value);

  Future<void> addNewValue(ValueModel valueModel) async =>
      setHiveValue(getHiveListValue()..add(valueModel));

  Future<void> updateValue(ValueModel valueModel) async => setHiveValue(
      getHiveListValue()..insert(getIndex(valueModel), valueModel));

  Future<void> removeValue(ValueModel valueModel) async =>
      setHiveValue(getHiveListValue()..remove(valueModel));

  int getIndex(ValueModel valueModel) => getHiveListValue().indexOf(valueModel);

  List<ValueModel> getHiveListValue() => Hive.box('values').get('list');
}
