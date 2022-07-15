import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:image_picker/image_picker.dart';

class UserApi {
  static signIn({required email, required password}) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000, // 5 seconds
        receiveTimeout: 5 * 1000 // 5 seconds
        );
    var dio = Dio(options);
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

  static signUp({required email, required name, required password}) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000, // 5 seconds
        receiveTimeout: 5 * 1000 // 5 seconds
        );
    var dio = Dio(options);

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

  static getUserData(id, token) async {
    BaseOptions options = BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000, // 5 seconds
        receiveTimeout: 5 * 1000 // 5 seconds
        );
    var dio = Dio(options);

    try {
      var response = await dio.get(
        baseUrl + '/api/v1/user/management/$id',
      );
      print('object');
      return response.data['data'];
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  static postProfilImage(
    id,
    token,
    XFile image,
  ) async {
    BaseOptions options = BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000, // 5 seconds
        receiveTimeout: 5 * 1000 // 5 seconds
        );
    var dio = Dio(options);

    String fileName = image.path.split('/').last;

    FormData formData = FormData.fromMap({
      "id_user": id,
      "file": await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      var response = await dio.post(
        baseUrl + '/api/v1/user/image',
        data: formData,
      );
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
