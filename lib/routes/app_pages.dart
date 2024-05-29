import 'package:app/bindings/home/gemini_binding.dart';
import 'package:app/bindings/setting_binding.dart';
import 'package:app/ui/pages/gemini/gemini_page.dart';
import 'package:app/ui/pages/inventory/inventory_page.dart';
import 'package:app/ui/pages/setting_page.dart';
import 'package:get/get.dart';

import '../bindings/inventory_binding.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(name: Routes.home, page: () => HomePage()),
    GetPage(
        name: Routes.setting,
        page: () => SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: Routes.inventory,
        page: () => InventoryPage(),
        binding: InventoryBinding()),
    GetPage(
        name: Routes.gemini,
        page: () => GeminiPage(),
        binding: GeminiBinding()),
  ];
}
