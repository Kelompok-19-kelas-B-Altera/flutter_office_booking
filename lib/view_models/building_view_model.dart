import 'package:flutter/material.dart';
import 'package:flutter_office_booking/models/api/building_api.dart';
import 'package:flutter_office_booking/models/building_model.dart';

class BuildingViewModel with ChangeNotifier {
  List<Data> buildingData = [];

  Future getAllBuilding() async {
    var kembalian = await BuildingApi.getAllBuilding();
    if (kembalian != null) {
      buildingData = kembalian;
      print(buildingData.length);
      print(buildingData[1].buildingName);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  double review(List<Reviews> reviewer) {
    var star1 = reviewer.where((element) => element.rating == 1).length;
    var star2 = reviewer.where((element) => element.rating == 2).length;
    var star3 = reviewer.where((element) => element.rating == 3).length;
    var star4 = reviewer.where((element) => element.rating == 4).length;
    var star5 = reviewer.where((element) => element.rating == 5).length;

    var review = (star1 * 1 + star2 * 2 + star3 * 3 + star4 * 4 + star5 * 5) /
        reviewer.length;

    reviewer.length;

    if (review.toString() != 'NaN') {
      return review;
    } else {
      return 0;
    }
  }
}
