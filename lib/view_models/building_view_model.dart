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

  getBuildingById(token, id) {
    BuildingApi.getBuildingById(id);
  }
}
