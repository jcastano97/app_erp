import 'package:app/controllers/inventory_item_controller.dart';
import 'package:get/get.dart';

class InventoryItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryItemController>(() => InventoryItemController());
  }
}
