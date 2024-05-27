import 'package:english_words/english_words.dart';

class WordPairUtil {
  static fromJson(dynamic jsonData) {
    return jsonData
        .map((e) => WordPair(e['first'], e['second']))
        .toList()
        .cast<WordPair>();
  }

  static toJson(dynamic wordPairList) {
    return wordPairList
        .map((e) => {'first': e.first, 'second': e.second})
        .toList();
  }
}
