import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/const.dart';

class SettingsService extends GetxService {
  final version = Const.version;
  late final RxString languageCode = Const.defaultLanguage.obs;
  late final RxBool darkMode = Const.defaultDarkMode.obs;

  Future<SettingsService> init() async {
    await GetStorage.init();
    languageCode.value =
        GetStorage().read('languageCode') ?? Const.defaultLanguage;
    darkMode.value = GetStorage().read('darkMode') ?? Const.defaultDarkMode;
    return this;
  }

  void setLanguageCode(String language) {
    languageCode.value = language;
    Get.updateLocale(Locale(language));
    GetStorage().write('languageCode', language);
  }

  void toggleDarkMode() {
    Get.changeThemeMode(darkMode.value ? ThemeMode.light : ThemeMode.dark);
    GetStorage().write('darkMode', !darkMode.value);
    darkMode.value = !darkMode.value;
  }
}
