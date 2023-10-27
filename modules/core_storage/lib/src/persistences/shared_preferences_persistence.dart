import 'package:shared_preferences/shared_preferences.dart';

import 'persistence.dart';

class SharedPreferencesPersistence with Persistence {
  const SharedPreferencesPersistence({required this.prefix});

  final String prefix;

  @override
  Future<bool> write(String key, String? value) async {
    final prefs = await SharedPreferences.getInstance();
    return value == null
        ? prefs.remove(prefix + key)
        : prefs.setString(prefix + key, value);
  }

  @override
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString(prefix + key));
  }

  @override
  Future<bool> writeBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(prefix + key, value);
  }

  @override
  Future<bool?> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(prefix + key);
  }

  @override
  Future<bool> writeInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(prefix + key, value);
  }

  @override
  Future<int?> readInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(prefix + key);
  }

  @override
  Future<bool> writeDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(prefix + key, value);
  }

  @override
  Future<double?> readDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(prefix + key);
  }

  @override
  Future<bool> writeStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(prefix + key, value);
  }

  @override
  Future<List<String>?> readStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(prefix + key);
  }
}