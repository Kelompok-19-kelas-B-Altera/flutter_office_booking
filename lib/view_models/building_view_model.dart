import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/building_api.dart';

class BuildingViewModel with ChangeNotifier {
  Future getAllBuilding(token) async {
    var kembalian = await BuildingApi.getAllBuilding();
    if (kembalian != null) {
      return true;
    } else {
      return false;
    }
  }

  getBuildingById(token, id) {
    BuildingApi.getBuildingById(id);
  }
}
