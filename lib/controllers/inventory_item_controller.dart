import 'package:app/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;

class InventoryItemController extends GetxController {
  final database = Get.find<AppDatabase>();

  // form controllers
  late TextEditingController nameController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController quantityController = TextEditingController();
  late TextEditingController quantityFactorController = TextEditingController();
  late TextEditingController purchasePriceController = TextEditingController();
  late TextEditingController sellPriceController = TextEditingController();
  late TextEditingController currencyPriceController = TextEditingController();
  // END form controllers

  final data = <InventoryItem>[].obs;

  @override
  void onReady() {
    _getData();
    super.onReady();
  }

  void _getData() async {
    data.value = await database.select(database.inventoryItemTable).get();
  }

  void addData() async {
    await database
        .into(database.inventoryItemTable)
        .insert(InventoryItemTableCompanion.insert(
          name: nameController.text,
          description: Value(descriptionController.text),
          quantity: Value(quantityController.text != ''
              ? int.parse(quantityController.text)
              : 0),
          quantityFactor: Value(quantityFactorController.text),
          purchasePrice: Value(purchasePriceController.text),
          sellPrice: Value(sellPriceController.text),
          currencyPrice: Value(currencyPriceController.text),
        ));
    data.value = await database.select(database.inventoryItemTable).get();
  }

  void deleteTask(int id) async {
    var deleteStatement = database.delete(database.inventoryItemTable)
      ..where((t) => t.id.equals(id));
    await deleteStatement.go();
    data.removeWhere((element) => element.id == id);
  }
}
