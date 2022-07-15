import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/services/api/review_api.dart';

class ReviewViewModel with ChangeNotifier {
  addReview({
    required String token,
    required int idUser,
    required int idBuilding,
    required int rating,
    required String review,
  }) async {
    print('a');
    var response = await ReviewApi.postReview(
      token,
      idUser,
      idBuilding,
      rating,
      review,
    );
    return response;
  }
}
