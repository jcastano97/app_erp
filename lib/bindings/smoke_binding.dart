import 'package:app/controllers/smoke/smoke_controller.dart';
import 'package:get/get.dart';

class SmokeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmokeController>(() => SmokeController());
  }
}
