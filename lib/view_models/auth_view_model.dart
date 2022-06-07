import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/user_api.dart';
import 'package:flutter_office_booking/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? userData;
  String? token;

  Future<bool> signIn({required email, required password}) async {
    var response = await UserApi.signIn(
      email: email,
      password: password,
    );

    if (response != false) {
      var data = await UserModel.tokenDecode(response['token']);
      userData = UserModel(
          uID: 1,
          username: data['username'],
          email: data['email'],
          password: 'password',
          fullName: 'fullName',
          phone: 'phone',
          role: data['role']);
      return true;
    } else {
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
