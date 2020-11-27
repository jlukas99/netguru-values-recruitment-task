import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StatusBar {
  static const DARK = true;
  static const LIGHT = false;

  static changeStatusBar(bool b) {
    if (b) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarColor: Get.theme.primaryColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarColor: Get.theme.primaryColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }
}
