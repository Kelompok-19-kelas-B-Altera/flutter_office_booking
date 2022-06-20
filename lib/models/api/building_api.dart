import 'package:dio/dio.dart';

class BuildingApi {
  static getAllBuilding() async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        );
    var dio = Dio(options);

    try {
      var response = await dio.get('http://108.136.240.248/api/v1/building');
      print(response.data);
      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e);
        print('false');
        return null;
      }
    }
  }

  static getBuildingById(String id) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        );
    var dio = Dio(options);

    try {
      var response =
          await dio.get('http://108.136.240.248/api/v1/building/' + id);
      print(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e);
        print('false');
      }
    }
  }
}
