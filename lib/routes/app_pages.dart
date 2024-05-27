import 'package:app/bindings/setting_binding.dart';
import 'package:app/ui/pages/erp/inventory/inventory_page.dart';
import 'package:app/ui/pages/erp/setting_page.dart';
import 'package:get/get.dart';

import '../bindings/inventory_binding.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/erp/home_page.dart';
import '../ui/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(
        name: Routes.SETTING,
        page: () => SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: Routes.INVENTORY,
        page: () => InventoryPage(),
        binding: InventoryBinding()),
  ];
}
