import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunction {
  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getValue(String key) async {
    SharedPreferences pref = await _getPreferences();
    return pref.getString(key);
  }

  Future<void> setStringValue(String key, String value) async {
    SharedPreferences pref = await _getPreferences();
    await pref.setString(key, value);
  }

  Future<bool> removeValue(String key) async {
    SharedPreferences pref = await _getPreferences();
    return await pref.remove(key);
  }
}
