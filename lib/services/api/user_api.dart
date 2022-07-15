import 'package:dio/dio.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:image_picker/image_picker.dart';

class UserApi {
  final Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 5 * 1000,
        receiveTimeout: 5 * 1000),
  );

  signIn({required email, required password}) async {
    final Map<String, dynamic> formLogin = {
      'email': email,
      'password': password,
    };

    try {
      final Response response =
          await dio.post(baseUrl + 'api/v1/auth/login', data: formLogin);
      return response.data['data'];
    } on DioError {
      return null;
    }
  }

  signUp({required email, required name, required password}) async {
    final Map<String, dynamic> formDaftar = {
      'email': email,
      'fullname': name,
      'password': password,
    };

    try {
      final Response response =
          await dio.post(baseUrl + 'api/v1/auth/register', data: formDaftar);
      return response.data;
    } on DioError {
      return null;
    }
  }

  getUserData(id, token) async {
    try {
      final Response response =
          await dio.get(baseUrl + 'api/v1/user/management/$id',
              options: Options(
                headers: {'Authorization': 'Bearer $token'},
              ));

      return response.data['data'];
    } on DioError {
      return null;
    }
  }

  postProfilImage(
    id,
    token,
    XFile image,
  ) async {
    final String fileName = image.path.split('/').last;

    final FormData formData = FormData.fromMap({
      "id_user": id,
      "file": await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      await dio.post(baseUrl + 'api/v1/user/image',
          data: formData,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
    } catch (e) {
      rethrow;
    }
  }
}
