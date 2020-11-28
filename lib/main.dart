import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'core/const/msg.dart';
import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'core/services/services.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Services.initServices();

  runApp(
    GetMaterialApp(
      translations: Msg(),
      translationsKeys: Msg().keys,
      supportedLocales: [
        const Locale('pl', 'PL'),
        const Locale('en', 'US'),
      ],
      locale: Get.locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      fallbackLocale: Locale('en', 'US'),
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        Get.updateLocale(deviceLocale);
        return;
      },
      theme: AppTheme.light,
      defaultTransition: Transition.fade,
      transitionDuration: Duration(seconds: 1),
      initialRoute: RoutesName.SPLASH,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      //title: 'app_name'.tr,
      debugShowCheckedModeBanner: false,
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
