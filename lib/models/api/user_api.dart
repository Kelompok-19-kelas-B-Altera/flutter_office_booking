import 'package:dio/dio.dart';
import 'package:flutter_office_booking/constants.dart';

class UserApi {
  static signIn({required email, required password}) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
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
      if (e.type == DioErrorType.response) {
        return false;
      }
    }
  }

  static signUp({required email, required name, required password}) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        );
    var dio = Dio(options);

    var formDaftar = {
      'email': email,
      'name': name,
      'password': password,
    };

    try {
      var response =
          await dio.post(baseUrl + '/api/v1/auth/register', data: formDaftar);
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return false;
      }
    }
  }
}
