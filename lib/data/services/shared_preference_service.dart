// lib/utils/shared_prefs.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _prefs;
  SharedPrefs(this._prefs);
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveLocale(Locale locale) async {
    try {
      await _prefs.setString(
          "locale", "${locale.languageCode}_${locale.countryCode}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Locale? getLocale() {
    try {
      String? loc = _prefs.getString("locale");
      if (loc != null) {
        return Locale(loc.split("_").first,
            loc.split("_").last.isNotEmpty ? loc.split("_").last : null);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }
}
