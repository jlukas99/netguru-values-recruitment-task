import 'package:get/get.dart';

import '../../core/controllers/values_controller.dart';
import '../../core/models/value.dart';

class FavoritesController extends GetxController {
  RxList<ValueModel> favoriteValues = List<ValueModel>().obs;

  ValuesController _valuesController = Get.find<ValuesController>();

  void getFavoriteValues() {
    favoriteValues.clear();

    _valuesController.getAllValues().forEach((e) {
      if (e.isFavorite == true) {
        favoriteValues.add(e);
      }
    });
  }

  @override
  void onInit() {
    getFavoriteValues();
    super.onInit();
  }
}
