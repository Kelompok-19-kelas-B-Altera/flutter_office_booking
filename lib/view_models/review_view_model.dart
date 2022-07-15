import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/services/api/review_api.dart';

class ReviewViewModel with ChangeNotifier {
  final ReviewApi reviewApi = ReviewApi();

  addReview({
    required String token,
    required int idUser,
    required int idBuilding,
    required int rating,
    required String review,
  }) async {
    var response = await reviewApi.postReview(
      token,
      idUser,
      idBuilding,
      rating,
      review,
    );
    return response;
  }
}
