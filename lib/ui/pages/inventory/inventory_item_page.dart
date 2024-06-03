import 'package:app/controllers/inventory_item_controller.dart';
import 'package:app/ui/components/common/styled_text.dart';
import 'package:app/ui/components/inventory/inventory_item_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_page.dart';

class InventoryItemPage extends GetView<InventoryItemController> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                        controller.isOpenForm.value ? Icons.close : Icons.add),
                    onPressed: () {
                      if (controller.isOpenForm.value) {
                        controller.closeForm();
                      } else {
                        controller.addData();
                      }
                    }),
              ],
            ),
          ),
          Obx(() =>
              controller.isOpenForm.value ? InventoryItemForm() : Container()),
          Obx(() => Column(
                children: controller.data
                    .map((inventoryItem) => Row(
                          children: [
                            Expanded(
                                child:
                                    StyledText.labelLarge(inventoryItem.name)),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () =>
                                  controller.editData(inventoryItem),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  controller.deleteData(inventoryItem),
                            ),
                          ],
                        ))
                    .toList(),
              )),
        ],
      ),
    );
  }
}
