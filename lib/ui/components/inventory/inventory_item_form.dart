import 'package:app/controllers/inventory_item_controller.dart';
import 'package:app/ui/components/styled_text.dart';
import 'package:app/utils/form_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryItemForm extends StatelessWidget {
  final inventoryItemController = Get.find<InventoryItemController>();
  final quantityFactorList = ['per_unit', 'per_g', 'per_kg'];
  final currencyPriceList = ['cop', 'usd', 'eur'];
  final _formKey = GlobalKey<FormState>();

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      inventoryItemController.submitData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          StyledText.labelLarge("Name"),
          TextFormField(
            controller: inventoryItemController.nameController,
            decoration: InputDecoration(hintText: "Name"),
            validator: FormUtil.validateRequired,
          ),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Description"),
          TextFormField(
            controller: inventoryItemController.descriptionController,
            decoration: InputDecoration(hintText: "Description"),
          ),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Quantity"),
          TextFormField(
            controller: inventoryItemController.quantityController,
            decoration: InputDecoration(hintText: "Quantity"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Quantity factor"),
          Obx(() => DropdownButton<String>(
                value: inventoryItemController.quantityFactorSelect.value != ''
                    ? inventoryItemController.quantityFactorSelect.value
                    : null,
                icon: const Icon(Icons.arrow_downward),
                onChanged: (String? value) {
                  inventoryItemController.quantityFactorSelect.value =
                      value ?? '';
                },
                items: quantityFactorList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.tr),
                  );
                }).toList(),
              )),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Purchase Price"),
          TextFormField(
            controller: inventoryItemController.purchasePriceController,
            decoration: InputDecoration(hintText: "Purchase Price"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Sell Price"),
          TextFormField(
            controller: inventoryItemController.sellPriceController,
            decoration: InputDecoration(hintText: "Sell Price"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          StyledText.labelLarge("Currency"),
          Obx(() => DropdownButton<String>(
                value: inventoryItemController.currencyPriceSelect.value != ''
                    ? inventoryItemController.currencyPriceSelect.value
                    : null,
                icon: const Icon(Icons.arrow_downward),
                onChanged: (String? value) {
                  inventoryItemController.currencyPriceSelect.value =
                      value ?? '';
                },
                items: currencyPriceList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
