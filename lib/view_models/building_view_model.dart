import 'package:flutter/material.dart';
import 'package:flutter_office_booking/models/api/building_api.dart';
import 'package:flutter_office_booking/models/building_model.dart';

class BuildingViewModel with ChangeNotifier {
  List<BuildingData> _buildingData = [];
  final List<BuildingData> _recomendedBuilding = [];
  final List<BuildingData> _mostViewBuilding = [];

  List<BuildingData> get buildingData => _buildingData;
  List<BuildingData> get recomendedBuilding => _recomendedBuilding;
  List<BuildingData> get mostViewBuilding => _mostViewBuilding;

  Future getAllBuilding() async {
    var response = await BuildingApi.getAllBuilding();
    if (response != null) {
      _buildingData = response;
      _recomendedBuilding.addAll(buildingData);
      _mostViewBuilding.addAll(buildingData);
      sortingBuilding();
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  sortingBuilding() {
    recomendedBuilding.sort((a, b) {
      var aRating = review(a.reviews!);
      var bRating = review(b.reviews!);
      return bRating.compareTo(aRating);
    });
    mostViewBuilding.sort((a, b) {
      return b.totalView!.compareTo(a.totalView!);
    });
  }

  double review(List<Reviews> reviewer) {
    var star1 = reviewer.where((element) => element.rating == 1).length;
    var star2 = reviewer.where((element) => element.rating == 2).length;
    var star3 = reviewer.where((element) => element.rating == 3).length;
    var star4 = reviewer.where((element) => element.rating == 4).length;
    var star5 = reviewer.where((element) => element.rating == 5).length;

    var review = (star1 * 1 + star2 * 2 + star3 * 3 + star4 * 4 + star5 * 5) /
        reviewer.length;

    if (review.toString() != 'NaN') {
      return review;
    } else {
      return 0;
    }
  }
}
