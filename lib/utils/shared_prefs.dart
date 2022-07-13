import 'package:shared_preferences/shared_preferences.dart';


///This utility has been made for [SharedPreferences] operations.
class SharedPrefsUtil {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setBool(
          {required String key, required bool value}) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> setDouble(
          {required String key, required double value}) async =>
      await _prefs!.setDouble(key, value);

  static Future<bool> setInt({required String key, required int value}) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(
          {required String key, required String value}) async =>
      await _prefs!.setString(key, value);

  static Future<bool> setStringList({required String key, required List<String> value}) async => await _prefs!.setStringList(key, value);

  static bool? getBool({required String key}) => _prefs!.getBool(key);

  static double? getDouble({required String key}) => _prefs!.getDouble(key);

  static int? getInt({required String key}) => _prefs!.getInt(key);

  static String? getString({required String key}) => _prefs!.getString(key);

  static List<String>? getStringList({required String key}) => _prefs!.getStringList(key);

  static Future<bool> remove({required String key}) async =>
      await _prefs!.remove(key);

  static Future<bool> clear() async => await _prefs!.clear();
}


