import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static setSearchHistory({required searchHistory}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String stringData = json.encode(searchHistory);

    if (prefs.containsKey('searchHistory')) {
      await prefs.remove('searchHistory');
    }
    await prefs.setString('searchHistory', stringData);
  }

  Future getSearchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? stringData = prefs.getString('searchHistory');
    if (stringData != null) {
      var searchHistory = json.decode(stringData);
      return searchHistory;
    } else {
      return null;
    }
  }

  setLoginData({
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final Map<String, String> data = {
      "email": email,
      "password": password,
    };

    final String stringData = json.encode(data);
    final List<int> encryptData = utf8.encode(stringData);
    final String doubleEncryptData = base64.encode(encryptData);

    if (prefs.containsKey('loginData')) {
      await prefs.remove('loginData');
    }
    await prefs.setString('loginData', doubleEncryptData);
  }

  Future getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? doubleEncryptData = prefs.getString('loginData');
    if (doubleEncryptData != null) {
      final encryptData = base64.decode(doubleEncryptData);
      final String stringData = utf8.decode(encryptData);
      final data = json.decode(stringData);
      return data;
    } else {
      return null;
    }
  }

  Future clearLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('loginData');
  }
}
