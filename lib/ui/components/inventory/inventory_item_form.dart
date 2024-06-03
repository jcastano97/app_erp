import 'package:app/controllers/inventory_item_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:app/ui/components/common/styled_select.dart';
import 'package:app/ui/components/common/styled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryItemForm extends StatelessWidget {
  final inventoryItemController = Get.find<InventoryItemController>();
  final quantityFactorList = [
    LanguageGlobalVar.perUnit,
    LanguageGlobalVar.perG,
    LanguageGlobalVar.perKG
  ];
  final currencyPriceList = const ['cop', 'usd', 'eur'];
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
          StyledTextField(
            controller: inventoryItemController.nameController,
            label: LanguageGlobalVar.name,
            required: true,
          ),
          SizedBox(
            height: 20,
          ),
          StyledTextField(
            controller: inventoryItemController.descriptionController,
            label: LanguageGlobalVar.description,
          ),
          SizedBox(
            height: 20,
          ),
          StyledTextField(
            controller: inventoryItemController.quantityController,
            label: LanguageGlobalVar.quantity,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          StyledSelect(
            controller: inventoryItemController.quantityFactorSelect,
            label: LanguageGlobalVar.quantityFactor,
            options: quantityFactorList,
          ),
          SizedBox(
            height: 20,
          ),
          StyledTextField(
            controller: inventoryItemController.purchasePriceController,
            label: LanguageGlobalVar.purchasePrice,
          ),
          SizedBox(
            height: 20,
          ),
          StyledTextField(
            controller: inventoryItemController.sellPriceController,
            label: LanguageGlobalVar.sellPrice,
          ),
          SizedBox(
            height: 20,
          ),
          StyledSelect(
            controller: inventoryItemController.currencyPriceSelect,
            label: LanguageGlobalVar.currency,
            options: currencyPriceList,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(LanguageGlobalVar.submit.tr),
            ),
          ),
        ],
      ),
    );
  }
}
