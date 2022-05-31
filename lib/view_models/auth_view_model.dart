import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/user_api.dart';
import 'package:flutter_office_booking/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? userData;

  Future<bool> signIn({required email, required password}) async {
    var data = await UserApi.getUser(email, password);

    if (data != null) {
      userData = data;
      print('Data Ada');
      return true;
    } else {
      print('Data Null');
      return false;
    }
  }
}
