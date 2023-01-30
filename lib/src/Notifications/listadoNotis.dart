import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class notisListado {
  // Obtain shared preferences.

  static List<String> notis = [];
  static String noti = "";
}

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyNoti = 'notificacion';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setPets(List<String> notis) async =>
      await _preferences?.setStringList(_keyNoti, notis);

  static List<String>? getPets() => _preferences?.getStringList(_keyNoti);
}
