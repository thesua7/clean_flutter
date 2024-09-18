import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final Future<SharedPreferences> _prefs;

  SharedPreferencesHelper(this._prefs);

  Future<void> setString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

// Add other types if needed (e.g., int, bool)
}
