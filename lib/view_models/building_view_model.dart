import 'package:flutter/cupertino.dart';
import 'package:flutter_office_booking/models/api/building_api.dart';

class BuildingViewModel with ChangeNotifier {
  getAllBuilding(token) {
    BuildingApi.getAllBuilding();
  }

  getBuildingById(token, id) {
    BuildingApi.getBuildingById(id);
  }
}
