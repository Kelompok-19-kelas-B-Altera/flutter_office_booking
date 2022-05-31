import 'package:dio/dio.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_office_booking/models/user_model.dart';

class UserApi {
  static Future<UserModel?> getUser(myEmail, myPassword) async {
    BaseOptions options = BaseOptions(
        // baseUrl: baseUrl + 'akun.json',
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 60 seconds
        receiveTimeout: 30 * 1000 // 60 seconds
        );
    var dio = Dio(options);
    List<UserModel> usersData = [];

    try {
      var response = await dio.get(baseUrl + 'akun.json');
      var data = response.data as Map<String, dynamic>;

      usersData.clear();

      data.forEach((key, value) {
        usersData.add(UserModel(
          uID: 1,
          username: 'username',
          email: value['email'],
          password: value['password'],
          fullName: 'fillName',
          phone: 'phone',
          role: 'role',
        ));
      });

      var index = usersData.indexWhere((element) =>
          element.email == myEmail && element.password == myPassword);

      print(myEmail);
      print(myPassword);
      print(index);

      if (index >= 0) {
        return usersData[index];
      } else {
        print('User Tidak Ditemukan');
        return null;
      }
    } on DioError catch (e) {
      // rethrow;
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType.connectTimeout');
        return null;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        print('DioErrorType.receiveTimeout');
        return null;
      }
    }
  }
}
