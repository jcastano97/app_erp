import 'package:app/service/setting_service.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingService>(() => SettingService());
  }
}
