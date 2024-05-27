import 'package:english_words/english_words.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/WordPairUtil.dart';

class HomeController extends GetxController {
  final navigationSelectedIndex = 0.obs;
  final pair = WordPair.random().obs;
  late final favorites = <WordPair>[].obs;

  HomeController() {
    if (GetStorage().hasData('favorites')) {
      favorites.value = WordPairUtil.fromJson(GetStorage().read('favorites'));
    }
  }

  void getNext() {
    pair.value = WordPair.random();
  }

  void toggleFavorite() {
    print("toggleFavorite");
    if (favorites.contains(pair.value)) {
      favorites.remove(pair.value);
    } else {
      favorites.add(pair.value);
    }
    GetStorage().write('favorites', WordPairUtil.toJson(favorites));
  }

  void removeFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
      GetStorage().write('favorites', WordPairUtil.toJson(favorites));
    }
  }

  void setNavigationSelectedIndex(int value) {
    navigationSelectedIndex.value = value;
  }
}
