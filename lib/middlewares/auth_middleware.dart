import 'package:app/controllers/auth_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    print('AuthMiddleware');
    final User? user = await authController.user.first;

    if (user == null) {
      return Get.rootDelegate.toNamed(Routes.login);
    } else {
      return Get.rootDelegate.toNamed(Routes.home);
    }
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('>>> Page ${page?.name} called');
    print('>>> User ${authController.user} logged');
    return page;
  }
/*
  @override
  List<Bindings> onBindingsStart(List<Bindings> bindings) {
    // This function will be called right before the Bindings are initialize,
    // then bindings is null
    bindings = [OtherBinding()];
    return bindings;
  }

  @override
  GetPageBuilder onPageBuildStart(GetPageBuilder page) {
    print('Bindings of ${page.toString()} are ready');
    return page;
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }
 */

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
