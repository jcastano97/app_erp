import 'package:app/language/language.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/service/setting_service.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  print("main");
  Get.put(await SettingService().init());
  WidgetsFlutterBinding.ensureInitialized();
  SettingService settingsService = Get.find<SettingService>();

  runApp(GetMaterialApp(
    title: 'App ERP',
    debugShowCheckedModeBanner: false,
    locale: Locale(settingsService.languageCode.value),
    fallbackLocale: Locale('en'),
    translations: Languages(),
    initialRoute: Routes.SPLASH,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
  ));
}
