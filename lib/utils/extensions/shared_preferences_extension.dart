import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  // Extension để set String value vào SharedPreferences
  Future<void> setStringValue(String key, String value) async {
    await setString(key, value);
  }

  // Extension để get String value từ SharedPreferences
  String? getStringValue(String key) {
    return getString(key);
  }

  // Extension để set bool value vào SharedPreferences
  Future<void> setBoolValue(String key, bool value) async {
    await setBool(key, value);
  }

  // Extension để get bool value từ SharedPreferences
  bool? getBoolValue(String key) {
    return getBool(key);
  }
}
