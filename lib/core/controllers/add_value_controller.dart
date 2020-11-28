import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netguru_values/views/main/main_view_controller.dart';

import '../models/value.dart';
import 'values_controller.dart';

class AddOurValueController extends GetxController {
  TextEditingController _valueTextController;
  TextEditingController get getValueTextController => _valueTextController;

  Future addValueToDB(bool favorite) async {
    if (_valueTextController.text.isNotEmpty) {
      await Get.find<ValuesController>().addNewValue(
          ValueModel(_valueTextController.text, isFavorite: favorite));

      _valueTextController.clear();
      Get.back();

      Get.showSnackbar(
          getCustomBar('sucessfully_add_value'.tr, Get.theme.primaryColor));

      if (Get.find<MainController>().isStopped)
        Get.find<MainController>().setRandomValue();
    } else {
      Get.showSnackbar(getCustomBar('error_add_value'.tr, Colors.red));
    }
  }

  getCustomBar(String text, Color color) => GetBar(
        backgroundColor: color,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(26),
        borderRadius: 8,
        forwardAnimationCurve: Curves.elasticOut,
        reverseAnimationCurve: Curves.easeIn,
        messageText: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: 3),
      );

  @override
  void onInit() {
    _valueTextController = TextEditingController();
    super.onInit();
  }
}
