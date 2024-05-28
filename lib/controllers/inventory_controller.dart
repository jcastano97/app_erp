import 'package:app/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  final database = Get.find<AppDatabase>();

  final taskData = <TodoItem>[].obs;
  late TextEditingController addTaskController;
  @override
  void onInit() {
    addTaskController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() async {
    taskData.value = await database.select(database.todoItems).get();
  }

  void addData() async {
    await database.into(database.todoItems).insert(TodoItemsCompanion.insert(
          title: addTaskController.text,
          content: '',
        ));
    taskData.value = await database.select(database.todoItems).get();
    addTaskController.clear();
  }

  void deleteTask(int id) async {
    var deleteStatement = await database.delete(database.todoItems)
      ..where((t) => t.id.equals(id));
    await deleteStatement.go();
    taskData.removeWhere((element) => element.id == id);
  }
}
