import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService extends GetxService {
  late GenerativeModel _model;
  late ChatSession _chat;
  late final _apiKey = "".obs;
  final selectedChatTemplate = ''.obs;
  final List<String> chatSelectTemplates = <String>['', 'Alien', 'Inventory'];
  final Map<String, String> chatTemplates = {
    'Alien': 'Eres un alien experto en planetas',
    'Inventory': 'Eres un experto en inventarios',
  };

  Future<GeminiService> init() async {
    await GetStorage.init();
    var savedApiKey = GetStorage().read('geminiApiKey');
    if (savedApiKey != null && savedApiKey != '') {
      _startClient(savedApiKey);
    }
    return this;
  }

  void setApiKey(String? apiKey) {
    if (apiKey != null && apiKey != '') {
      _startClient(apiKey);
    }
    GetStorage().remove('geminiApiKey');
    _apiKey.value = '';
  }

  bool hasApiKey() {
    return _apiKey.value != '';
  }

  void _startClient(String apiKey) {
    _apiKey.value = apiKey;
    GetStorage().write('geminiApiKey', apiKey);
    if (selectedChatTemplate.value == '') {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
    } else {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
        systemInstruction:
            Content.text(chatTemplates[selectedChatTemplate.value]!),
      );
    }
    _chat = _model.startChat();
  }

  void setSelectedChatTemplate(String? value) {
    selectedChatTemplate.value = '';
    if (value != null && value != '') {
      selectedChatTemplate.value = value;
    }
    _startClient(_apiKey.value);
  }

  ChatSession get chat => _chat;
}
