import 'package:app/language/language_global_var.dart';
import 'package:app/ui/components/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    if (controller.favorites.isEmpty) {
      return Center(
        child: StyledText.headlineLarge(LanguageGlobalVar.noFavorites.tr),
      );
    }
    return Obx(
      () => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: StyledText.headlineLarge(controller.favorites.length == 1
                ? LanguageGlobalVar.oneFavorites.tr
                : LanguageGlobalVar.multipleFavorites.trParams(
                    {'count': controller.favorites.length.toString()})),
          ),
          for (var pair in controller.favorites)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.removeFavorite(pair);
                },
                label: Text(pair.asLowerCase),
                icon: Icon(Icons.delete),
              ),
            ),
        ],
      ),
    );
  }
}
