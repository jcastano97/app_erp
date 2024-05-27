import 'package:app/controllers/inventory_controller.dart';
import 'package:get/get.dart';

class InventoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }
}
