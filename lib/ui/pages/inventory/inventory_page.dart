import 'package:app/controllers/inventory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_page.dart';

class InventoryPage extends GetView<InventoryController> {
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
                  controller: controller.addTaskController,
                  decoration: InputDecoration(hintText: "Enter a task"),
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
                    itemCount: controller.taskData.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(controller.taskData[index].title),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => controller
                              .deleteTask(controller.taskData[index].id)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
