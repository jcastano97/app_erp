import 'package:english_words/english_words.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final navigationSelectedIndex = 0.obs;
  final pair = WordPair.random().obs;
  final favorites = <WordPair>[].obs;

  @override
  void onInit() {
    print('${DateTime.now()}');
    print("onInit");
    super.onInit();
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
  }

  void removeFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    }
  }

  void setNavigationSelectedIndex(int value) {
    navigationSelectedIndex.value = value;
  }
}
