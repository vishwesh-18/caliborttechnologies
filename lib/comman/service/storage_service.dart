import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  bool getIslogedIn() {
    return _prefs.getString(AppConstant.USER_TOKEN_KEY) == null ? false : true;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
