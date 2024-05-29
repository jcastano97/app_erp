import 'package:app/service/gemini_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiController extends GetxController {
  final loading = false.obs;
  final geminiService = Get.find<GeminiService>();
  late TextEditingController apiKeyController;
  final messageHistory = <({Image? image, String? text, bool fromUser})>[].obs;
  late TextEditingController searchController;
  @override
  void onInit() {
    super.onInit();
    apiKeyController = TextEditingController();
    searchController = TextEditingController();
    var savedApiKey = GetStorage().read('geminiApiKey');
    if (savedApiKey != null) {
      apiKeyController.text = savedApiKey;
      var savedMessageHistory = GetStorage().read('messageHistory');
      if (savedMessageHistory != null) {
        messageHistory.value = savedMessageHistory
            .map((e) => (
                  image: e['image'] != null ? Image.asset(e['image']) : null,
                  text: e['text'],
                  fromUser: e['fromUser'] != null && e['fromUser'],
                ))
            .toList()
            .cast<({Image? image, String? text, bool fromUser})>();
      }
    }
  }

  void setApiKey() {
    geminiService.setApiKey(apiKeyController.text);
  }

  void search() async {
    loading.value = true;
    var search = searchController.text;
    messageHistory.add((image: null, text: search, fromUser: true));
    searchController.text = '';
    final response = await geminiService.chat.sendMessage(
      Content.text(search),
    );
    final text = response.text;
    messageHistory.add((image: null, text: text, fromUser: false));
    GetStorage().write(
        'messageHistory',
        messageHistory
            .map((m) => {
                  'fromUser': m.fromUser,
                  'text': m.text,
                  'image': m.image,
                })
            .toList());
    loading.value = false;
  }

  void setSelectedChatTemplate(String? value) {
    GetStorage().remove('messageHistory');
    messageHistory.value = [];
    geminiService.setSelectedChatTemplate(value);
  }
}
