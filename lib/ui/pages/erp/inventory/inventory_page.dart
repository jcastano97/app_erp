import 'package:app/controllers/inventory_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:app/ui/components/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_page.dart';

class InventoryPage extends GetView<InventoryController> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
        child: StyledText.displayLarge(LanguageGlobalVar.inventory.tr));
  }
}
