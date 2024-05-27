import 'package:app/controllers/home_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favorites_page.dart';
import 'generator_page.dart';
import 'settings_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            Obx(
              () => SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text(LanguageGlobalVar.home.tr),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text(LanguageGlobalVar.favorites.tr),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text(LanguageGlobalVar.settings.tr),
                    ),
                  ],
                  selectedIndex: controller.navigationSelectedIndex.value,
                  onDestinationSelected: (value) {
                    controller.setNavigationSelectedIndex(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Obx(
                  () => getNavigationWidget(
                      controller.navigationSelectedIndex.value),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget getNavigationWidget(num selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return GeneratorPage();
      case 1:
        return FavoritesPage();
      case 2:
        return SettingsPage();
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }
  }
}
