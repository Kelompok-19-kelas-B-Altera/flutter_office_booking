import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:image_picker/image_picker.dart';

class UserApi {
  final Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000, // 30 seconds
        receiveTimeout: 5 * 1000 // 30 seconds
        ),
  );

  signIn({required email, required password}) async {
    var formLogin = {
      'email': email,
      'password': password,
    };

    try {
      var response =
          await dio.post(baseUrl + '/api/v1/auth/login', data: formLogin);
      return response.data['data'];
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  signUp({required email, required name, required password}) async {
    var formDaftar = {
      'email': email,
      'fullname': name,
      'password': password,
    };

    try {
      var response =
          await dio.post(baseUrl + '/api/v1/auth/register', data: formDaftar);
      return response.data;
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  getUserData(id, token) async {
    try {
      var response = await dio.get(baseUrl + '/api/v1/user/management/$id',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      print('object');
      return response.data['data'];
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  postProfilImage(
    id,
    token,
    XFile image,
  ) async {
    String fileName = image.path.split('/').last;

    FormData formData = FormData.fromMap({
      "id_user": id,
      "file": await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      var response = await dio.post(baseUrl + '/api/v1/user/image',
          data: formData,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
