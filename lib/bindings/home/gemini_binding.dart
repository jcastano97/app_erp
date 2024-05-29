import 'package:app/controllers/home/gemini_controller.dart';
import 'package:get/get.dart';

class GeminiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeminiController>(() => GeminiController());
  }
}
