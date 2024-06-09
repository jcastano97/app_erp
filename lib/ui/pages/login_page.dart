import 'package:app/controllers/auth_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/service/setting_service.dart';
import 'package:app/ui/components/common/styled_card.dart';
import 'package:app/ui/components/common/styled_text.dart';
import 'package:app/ui/pages/common_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingService settingService = Get.find<SettingService>();
    return CommonPage(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyledText.headlineLarge(LanguageGlobalVar.modules.tr),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            settingService.goTo(Routes.inventory);
          },
          child: StyledCard(
            name: LanguageGlobalVar.language.tr,
          ),
        ),
      ],
    ));
  }
}
