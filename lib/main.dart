import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/config/pages.dart';
import 'core/config/routes.dart';
import 'core/const/msg.dart';
import 'core/services/services.dart';
import 'utils/theme.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Services.initServices();

  runApp(
    GetMaterialApp(
      translations: Msg(),
      locale: Locale("en", "US"),
      supportedLocales: [Locale("en", "US")],
      fallbackLocale: Locale("en", "US"),
      theme: AppTheme.light,
      defaultTransition: Transition.fade,
      transitionDuration: Duration(seconds: 1),
      initialRoute: RoutesName.SPLASH,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      title: 'app_name'.tr,
      builder: (_, widget) {
        return GestureDetector(
          onTap: () => Get.focusScope.unfocus(),
          child: ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(_, widget),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800,
                  name: TABLET, scaleFactor: 1.25),
              ResponsiveBreakpoint.autoScale(1000,
                  name: TABLET, scaleFactor: 1.5),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
        );
      },
      getPages: Pages.pages,
    ),
  );
}
