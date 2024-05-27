import 'package:app/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class CommonPage extends StatelessWidget {
  late final Widget _child;

  CommonPage({required Widget child}) {
    _child = child;
  }

  List<NavigationRailDestination> createDestinations() {
    var destinations = <NavigationRailDestination>[];
    for (NavigationItem item in SettingService.navigationItemIndex) {
      var navigationRail = new NavigationRailDestination(
        icon: Icon(item.icon),
        label: Text(item.label),
      );
      destinations.add(navigationRail);
      continue;
    }
    return destinations;
  }

  @override
  Widget build(BuildContext context) {
    SettingService settingService = Get.find<SettingService>();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            Obx(
              () => SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: createDestinations(),
                  selectedIndex: settingService.navigationSelectedIndex.value,
                  onDestinationSelected: (value) {
                    settingService.setNavigationSelectedIndex(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: _child,
              ),
            ),
          ],
        ),
      );
    });
  }
}
