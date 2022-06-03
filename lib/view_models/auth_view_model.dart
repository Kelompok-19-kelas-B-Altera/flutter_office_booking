import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/user_api.dart';
import 'package:flutter_office_booking/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? userData;
  String? token;
  bool checkLength = true;

  bool get getCheckLenght => checkLength;

  Future<bool> signIn({required email, required password}) async {
    var data = await UserApi.signIn(email: email, password: password);

    if (data != null) {
      print('Data Ada');
      return true;
    } else {
      print('Data Null');
      return false;
    }
  }

  Future<bool> SignUp(
      {required email, required username, required password}) async {
    var data = await UserApi.signUp(
        email: email, username: username, password: password);

    print(data);
    if (data != null) {
      print('Data Ada');
      return true;
    } else {
      print('Data Null');
      return false;
    }
  }
}
