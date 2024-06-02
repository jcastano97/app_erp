import 'package:app/language/language_global_var.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService {
  final version = Const.version;
  late final RxString languageCode = Const.defaultLanguage.obs;
  late final RxBool darkMode = Const.defaultDarkMode.obs;
  final navigationSelectedIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  static List<NavigationItem> navigationItemIndex = [
    NavigationItem(
        route: Routes.home, icon: Icons.home, label: LanguageGlobalVar.home.tr),
    NavigationItem(
        route: Routes.inventory,
        icon: Icons.folder_special,
        label: LanguageGlobalVar.inventory.tr),
    NavigationItem(
        route: Routes.gemini, icon: Icons.import_contacts, label: 'Gemini'),
    NavigationItem(
        route: Routes.setting,
        icon: Icons.settings,
        label: LanguageGlobalVar.settings.tr),
  ];

  Future<SettingService> init() async {
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

  void setNavigationSelectedIndex(int selectedIndex) {
    navigationSelectedIndex.value = selectedIndex;
    Get.offAllNamed(navigationItemIndex[selectedIndex].route);
  }

  void goTo(String route) {
    for (int i = 0; i < navigationItemIndex.length; i++) {
      var item = navigationItemIndex[i];
      if (item.route == route) {
        navigationSelectedIndex.value = i;
        Get.offAllNamed(item.route);
      }
    }
  }
}

class NavigationItem {
  late final String route;
  late final IconData icon;
  late final String label;
  NavigationItem(
      {required this.route, required this.icon, required this.label});
}
