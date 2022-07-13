import 'package:flutter/material.dart';
import 'package:flutter_office_booking/models/api/user_api.dart';
import 'package:flutter_office_booking/models/storage/local_storage.dart';
import 'package:flutter_office_booking/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? userData;
  String? _token;

  String? get token => _token;

  AuthViewModel() {
    _init();
  }

  void _init() async {
    print('object');
    var data = await LocalStorage.getLoginData();
    if (data != null) {
      await signIn(
        email: data['email'],
        password: data['password'],
      );
    }
  }

  updateData() async {
    var data = await UserApi.getUserData(userData!.id, _token);
    userData = UserModel(
      id: data['id'],
      email: data['email'],
      fullName: data['fullname'],
      role: 'USER',
      picUrl: data['pic_url'],
    );
    notifyListeners();
  }

  logOut() async {
    userData = null;
    _token = null;
    LocalStorage.clearLoginData();

    notifyListeners();
  }

  Future<bool> signIn({
    required email,
    required password,
  }) async {
    var response = await UserApi.signIn(
      email: email,
      password: password,
    );

    if (response != null) {
      _token = response['token'];
      var data = await UserModel.tokenDecode(response['token']);
      var imgUrl = await UserApi.getUserData(data['id'], _token);
      userData = UserModel(
        id: data['id'],
        email: data['email'],
        fullName: data['fullname'],
        role: data['role'],
        picUrl: imgUrl['pic_url'],
      );

      LocalStorage.setLoginData(
        email: email,
        password: password,
      );
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
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  addProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        await UserApi.postProfilImage(
          userData!.id,
          token,
          image,
        );
      }
      updateData();
    } catch (e) {
      print('object');
      print(e);
    }
  }
}
