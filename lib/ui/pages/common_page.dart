import 'package:app/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class CommonPage extends StatelessWidget {
  final settingService = Get.find<SettingService>();
  late final Widget _child;

  CommonPage({required Widget child}) {
    _child = child;
  }

  List<NavigationRailDestination> createDestinations() {
    var destinations = <NavigationRailDestination>[];
    for (NavigationItem item in SettingService.navigationItemIndex) {
      var navigationRail = NavigationRailDestination(
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
    double screenHeight = MediaQuery.of(context).size.height;
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
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: screenHeight),
                child: SingleChildScrollView(
                  controller: settingService.scrollController,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: _child,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
