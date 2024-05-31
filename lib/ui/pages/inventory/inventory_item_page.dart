import 'package:app/controllers/inventory_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_page.dart';

class InventoryItemPage extends GetView<InventoryItemController> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(hintText: "Enter a inventory"),
                )),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      controller.addData();
                    })
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(controller.data[index].name),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              controller.deleteTask(controller.data[index].id)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
