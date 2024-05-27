import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../language/language_global_var.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${LanguageGlobalVar.language.tr}: "),
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
                        Get.updateLocale(Locale('en'));
                        GetStorage().write('languageCode', 'en');
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
                        Get.updateLocale(Locale('es'));
                        GetStorage().write('languageCode', 'es');
                      },
                      child: Text(LanguageGlobalVar.spanish.tr),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
