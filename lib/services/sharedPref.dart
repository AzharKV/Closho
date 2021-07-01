import 'package:shared_preferences/shared_preferences.dart';

int userSignedIn = 0;

class SharedPref {
  Future<void> saveInt(String key, int value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  Future<int> readInt(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? 0;
  }

  Future<String> readString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }

  Future<void> saveString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<void> delete(String key) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
