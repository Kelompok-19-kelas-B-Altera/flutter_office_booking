import 'dart:convert';

import 'package:dio/dio.dart';

class ReviewApi {
  final Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        ),
  );

  Future postReview(String token, int idUser, int idBuilding, int rating,
      String review) async {
    try {
      var data = {
        "review": review,
        "rating": rating,
        "id_user": idUser,
        "id_building": idBuilding
      };

      var jsonData = json.encode(data);
      final response = await dio.post('http://108.136.240.248/api/v1/review',
          data: jsonData,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return null;
      }
    }
  }
}
