import 'package:app/bindings/auth_binding.dart';
import 'package:app/bindings/home/gemini_binding.dart';
import 'package:app/bindings/setting_binding.dart';
import 'package:app/bindings/smoke_binding.dart';
import 'package:app/middlewares/auth_middleware.dart';
import 'package:app/ui/pages/chatbot/chatbot_page.dart';
import 'package:app/ui/pages/gemini/gemini_page.dart';
import 'package:app/ui/pages/inventory/inventory_item_page.dart';
import 'package:app/ui/pages/login_page.dart';
import 'package:app/ui/pages/setting_page.dart';
import 'package:app/ui/pages/smoke/smoke_page.dart';
import 'package:get/get.dart';

import '../bindings/inventory_item_binding.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
        name: Routes.login, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(
      name: Routes.smoke,
      page: () => SmokePage(),
      binding: SmokeBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => ChatbotPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.inventory,
      page: () => InventoryItemPage(),
      binding: InventoryItemBinding(),
    ),
    GetPage(
      name: Routes.gemini,
      page: () => GeminiPage(),
      binding: GeminiBinding(),
    ),
  ];
}
