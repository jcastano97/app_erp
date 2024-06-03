import 'package:app/language/language_global_var.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMenu extends StatelessWidget {
  static List<Map<String, Object>> navigationItemIndex = [
    {
      'route': Routes.home,
      'icon': Icons.home,
      'label': LanguageGlobalVar.home.tr,
    },
    {
      'route': Routes.inventory,
      'icon': Icons.folder_special,
      'label': LanguageGlobalVar.inventory.tr,
    },
    {
      'route': Routes.gemini,
      'icon': Icons.import_contacts,
      'label': LanguageGlobalVar.gemini.tr,
    },
    {
      'route': Routes.setting,
      'icon': Icons.settings,
      'label': LanguageGlobalVar.settings.tr,
    },
  ];

  final settingService = Get.find<SettingService>();

  final double constrainMaxWidth;

  CommonMenu({required this.constrainMaxWidth});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => NavigationRail(
          extended: constrainMaxWidth >= 600,
          destinations: navigationItemIndex
              .map((n) => NavigationRailDestination(
                    icon: Icon(n['icon'] as IconData?),
                    label: Text(n['label'] as String),
                  ))
              .toList(),
          selectedIndex: settingService.navigationSelectedIndex.value,
          onDestinationSelected: (value) {
            settingService.setNavigationSelectedIndex(value);
          },
        ),
      ),
    );
  }
}
