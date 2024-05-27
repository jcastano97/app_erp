import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
