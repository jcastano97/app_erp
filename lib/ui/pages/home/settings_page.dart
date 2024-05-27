import 'package:app/ui/components/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../language/language_global_var.dart';
import '../../../service/settings_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsService settingsService = Get.find<SettingsService>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText.labelLarge("${LanguageGlobalVar.language.tr}: "),
              SizedBox(
                width: 10,
              ),
              Get.locale?.languageCode == 'en'
                  ? OutlinedButton(
                      onPressed: () {},
                      child: Text(LanguageGlobalVar.english.tr),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        settingsService.setLanguageCode('en');
                      },
                      child: Text(LanguageGlobalVar.english.tr),
                    ),
              SizedBox(
                width: 10,
              ),
              Get.locale?.languageCode == 'es'
                  ? OutlinedButton(
                      onPressed: () {},
                      child: Text(LanguageGlobalVar.spanish.tr),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        settingsService.setLanguageCode('es');
                      },
                      child: Text(LanguageGlobalVar.spanish.tr),
                    ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledText.labelLarge("${LanguageGlobalVar.darkMode.tr}: "),
                SizedBox(
                  width: 10,
                ),
                settingsService.darkMode.value
                    ? OutlinedButton(
                        onPressed: () {},
                        child: Text(LanguageGlobalVar.yes.tr),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          settingsService.toggleDarkMode();
                        },
                        child: Text(LanguageGlobalVar.yes.tr),
                      ),
                SizedBox(
                  width: 10,
                ),
                !settingsService.darkMode.value
                    ? OutlinedButton(
                        onPressed: () {},
                        child: Text(LanguageGlobalVar.no.tr),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          settingsService.toggleDarkMode();
                        },
                        child: Text(LanguageGlobalVar.no.tr),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
