import 'package:app/language/language_global_var.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../components/home/big_card.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => BigCard(pair: controller.pair.value)),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: ElevatedButton.icon(
                    key: ValueKey<IconData>(getFavoriteIcon(controller)),
                    onPressed: () {
                      // appState.toggleFavorite();
                      controller.toggleFavorite();
                    },
                    icon: Icon(getFavoriteIcon(controller)),
                    label: Text(LanguageGlobalVar.like.tr),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  controller.getNext();
                },
                child: Text(LanguageGlobalVar.next.tr),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData getFavoriteIcon(HomeController controller) {
    return controller.favorites.contains(controller.pair.value)
        ? Icons.favorite
        : Icons.favorite_border;
  }
}
