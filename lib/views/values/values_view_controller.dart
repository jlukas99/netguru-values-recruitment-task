import 'package:get/get.dart';
import 'package:netguru_values/core/controllers/values_controller.dart';
import 'package:netguru_values/core/models/value.dart';

class AllValuesController extends GetxController {
  RxList<ValueModel> allValues = List<ValueModel>().obs;

  ValuesController _valuesController = Get.find<ValuesController>();

  void getAllValues() => allValues.assignAll(_valuesController.getAllValues());

  void reloadAllValues() {
    allValues.clear();
    getAllValues();
  }

  @override
  void onInit() {
    getAllValues();
    super.onInit();
  }
}
