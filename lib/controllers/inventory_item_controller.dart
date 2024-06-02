import 'package:app/database/database.dart';
import 'package:app/utils/form_util.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;

class InventoryItemController extends GetxController {
  final inventoryItemDao = Get.find<AppDatabase>().inventoryItemDao;
  final isOpenForm = false.obs;
  final editInventoryItem = Rx<InventoryItemTableData?>(null);

  // form controllers
  late TextEditingController nameController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController quantityController = TextEditingController();
  final quantityFactorSelect = ''.obs;
  late TextEditingController purchasePriceController = TextEditingController();
  late TextEditingController sellPriceController = TextEditingController();
  final currencyPriceSelect = ''.obs;
  // END form controllers

  final data = <InventoryItemTableData>[].obs;

  @override
  void onReady() {
    _getData();
    super.onReady();
  }

  void _getData() async {
    data.value = await inventoryItemDao.getAll();
  }

  void submitData() async {
    if (editInventoryItem.value == null) {
      await inventoryItemDao.insertOne(InventoryItemTableCompanion.insert(
        name: nameController.text,
        description: FormUtil.getValue(descriptionController.text),
        quantity: FormUtil.getIntValueWithDefault(quantityController.text, 0),
        quantityFactor: FormUtil.getValue(quantityFactorSelect.value),
        purchasePrice: FormUtil.getValue(purchasePriceController.text),
        sellPrice: FormUtil.getValue(sellPriceController.text),
        currencyPrice: FormUtil.getValue(currencyPriceSelect.value),
        createdAt: Value(DateTime.now()),
      ));
    } else {
      await inventoryItemDao.updateOne(editInventoryItem.value!.copyWith(
        name: nameController.text,
        description: FormUtil.getValue(descriptionController.text),
        quantity: FormUtil.getInt(quantityController.text),
        quantityFactor: FormUtil.getValue(quantityFactorSelect.value),
        purchasePrice: FormUtil.getValue(purchasePriceController.text),
        sellPrice: FormUtil.getValue(sellPriceController.text),
        currencyPrice: FormUtil.getValue(currencyPriceSelect.value),
        updatedAt: Value(DateTime.now()),
      ));
    }
    data.value = await inventoryItemDao.getAll();
    isOpenForm.value = false;
  }

  void addData() async {
    nameController.text = '';
    descriptionController.text = '';
    quantityController.text = '';
    quantityFactorSelect.value = '';
    purchasePriceController.text = '';
    sellPriceController.text = '';
    currencyPriceSelect.value = '';
    editInventoryItem.value = null;
    isOpenForm.value = true;
  }

  void editData(InventoryItemTableData inventoryItem) async {
    nameController.text = inventoryItem.name;
    descriptionController.text = inventoryItem.description ?? '';
    quantityController.text = inventoryItem.quantity.toString();
    quantityFactorSelect.value = inventoryItem.quantityFactor ?? '';
    purchasePriceController.text = inventoryItem.purchasePrice ?? '';
    sellPriceController.text = inventoryItem.sellPrice ?? '';
    currencyPriceSelect.value = inventoryItem.currencyPrice ?? '';
    editInventoryItem.value = inventoryItem;
    isOpenForm.value = true;
  }

  void deleteData(InventoryItemTableData inventoryItem) async {
    await inventoryItemDao.deleteOne(inventoryItem);
    data.removeWhere((element) => element.id == inventoryItem.id);
  }

  void closeForm() {
    isOpenForm.value = false;
  }
}
