import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/api/user_api.dart';
import '../services/storage/local_storage.dart';
import '../models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  final UserApi userApi = UserApi();
  final LocalStorage localStorage = LocalStorage();

  UserModel? userData;
  String? _token;

  String? get token => _token;

  AuthViewModel() {
    _init();
  }

  void _init() async {
    final data = await localStorage.getLoginData();
    if (data != null) {
      await signIn(
        email: data['email'],
        password: data['password'],
      );
    }
  }

  updateData() async {
    final data = await userApi.getUserData(userData!.id, _token);
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
    localStorage.clearLoginData();

    notifyListeners();
  }

  Future<bool> signIn({
    required email,
    required password,
  }) async {
    final response = await userApi.signIn(
      email: email,
      password: password,
    );

    if (response != null) {
      _token = response['token'];
      final data = await UserModel.tokenDecode(response['token']);
      final imgUrl = await userApi.getUserData(data['id'], _token);
      userData = UserModel(
        id: data['id'],
        email: data['email'],
        fullName: data['fullname'],
        role: data['role'],
        picUrl: imgUrl['pic_url'],
      );

      localStorage.setLoginData(
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
    final response = await userApi.signUp(
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
        await userApi.postProfilImage(
          userData!.id,
          token,
          image,
        );
      }
      updateData();
    } catch (e) {
      rethrow;
    }
  }
}
