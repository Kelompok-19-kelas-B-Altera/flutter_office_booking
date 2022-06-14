import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/user_api.dart';
import 'package:flutter_office_booking/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? userData;
  String? _token;

  String? get token => _token;

  logOut() async {
    userData = null;
    _token = null;

    notifyListeners();
  }

  Future<bool> signIn({required email, required password}) async {
    var response = await UserApi.signIn(
      email: email,
      password: password,
    );

    if (response != false) {
      _token = response['token'];
      var data = await UserModel.tokenDecode(response['token']);
      userData = UserModel(
        email: data['email'],
        fullName: data['fullname'],
        role: data['role'],
      );
      print(_token);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp({
    required email,
    required name,
    required password,
  }) async {
    var response = await UserApi.signUp(
      email: email,
      name: name,
      password: password,
    );
    if (response != false) {
      return true;
    } else {
      return false;
    }
  }
}
