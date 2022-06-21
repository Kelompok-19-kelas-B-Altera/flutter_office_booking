import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/building_api.dart';
import 'package:flutter_office_booking/models/building_model.dart';

class BuildingViewModel with ChangeNotifier {
  List<BuildingModel> buildingList = [];

  Future getAllBuilding() async {
    var kembalian = await BuildingApi.getAllBuilding();
    if (kembalian != null) {
      buildingList = kembalian;
      print(buildingList[1].complex.city);
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
