import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static setSearchHistory({required searchHistory}) async {
    final prefs = await SharedPreferences.getInstance();

    String stringData = json.encode(searchHistory);

    if (prefs.containsKey('searchHistory')) {
      await prefs.remove('searchHistory');
    }
    await prefs.setString('searchHistory', stringData);
  }

  static Future getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();

    var stringData = prefs.getString('searchHistory');
    if (stringData != null) {
      var searchHistory = json.decode(stringData);
      return searchHistory;
    } else {
      return null;
    }
  }

  static setLoginData({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final data = {
      "email": email,
      "password": password,
    };

    String stringData = json.encode(data);
    final encryptData = utf8.encode(stringData);
    final doubleEncryptData = base64.encode(encryptData);

    if (prefs.containsKey('loginData')) {
      await prefs.remove('loginData');
    }
    await prefs.setString('loginData', doubleEncryptData);
  }

  static Future getLoginData() async {
    final prefs = await SharedPreferences.getInstance();

    var doubleEncryptData = prefs.getString('loginData');
    if (doubleEncryptData != null) {
      var encryptData = base64.decode(doubleEncryptData);
      var stringData = utf8.decode(encryptData);
      var data = json.decode(stringData);
      return data;
    } else {
      return null;
    }
  }

  static Future clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('loginData');
  }
}
