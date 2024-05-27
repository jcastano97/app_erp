import 'package:app/utils/const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService {
  late String? version;
  late String? languageCode;

  /*
  // TODO: Create FlutterSecureStorage
  late FlutterSecureStorage _secureStorage;

  // Get SecureStorage instance
  FlutterSecureStorage get storage => _secureStorage;*/

  Future<SettingService> init() async {
    await GetStorage.init();
    languageCode = GetStorage().read('languageCode');
    version = Const.version;
    return this;
  }

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }
}
