import 'package:app/language/language.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  print("main");
  await GetStorage.init();
  var languageCode = GetStorage().read('languageCode');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    title: 'App ERP',
    debugShowCheckedModeBanner: false,
    locale: languageCode != null ? Locale(languageCode) : Locale('en'),
    fallbackLocale: Locale('en'),
    translations: Languages(),
    initialRoute: Routes.SPLASH,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    defaultTransition: Transition.native,
    getPages: AppPages.pages,
  ));
}
