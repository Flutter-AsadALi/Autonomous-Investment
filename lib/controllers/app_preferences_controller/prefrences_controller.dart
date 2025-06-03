import 'dart:developer';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesProvider extends ChangeNotifier {
  EncryptedSharedPreferences encryptedSharedPreferences =
  EncryptedSharedPreferences();

  ///
  /// Set a string value in encrypted preferences
  ///
  Future<void> setString(String key, String value) async {
    log("this is the value from prefs controller $key == $value");
    await encryptedSharedPreferences.setString(key, value);
    notifyListeners();  // Notify listeners when data is set
  }

  ///
  /// Set a list of strings in regular shared preferences
  ///
  Future<void> setListString(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
    notifyListeners();  // Notify listeners when data is set
  }

  ///
  /// Get a string value from encrypted preferences
  ///
  Future<String> getString(String key) async {
    String val = await encryptedSharedPreferences.getString(key);
    log("this is the value from prefs controller $key == $val");
    return val;
  }

  ///
  /// Get a list of strings from shared preferences
  ///
  Future<List<String>?> getListString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? val = prefs.getStringList(key);
    log("this is the value from prefs controller $key == $val");
    return val;
  }

  ///
  /// Clear all encrypted preferences
  ///
  Future<void> clearEncryptedPrefs() async {
    await encryptedSharedPreferences.clear();
    notifyListeners();  // Notify listeners after clearing prefs
  }

  ///
  /// Remove a specific key from encrypted preferences
  ///
  Future<void> remove(String key) async {
    encryptedSharedPreferences.remove(key).then((bool success) {
      if (success) {
        encryptedSharedPreferences.setString(key, "");
        log('success');
      } else {
        log('fail');
      }
      notifyListeners();  // Notify listeners after removing key
    });
  }
}
