import 'package:flutter/material.dart';
import 'package:flutter_office_booking/models/building_model.dart';

import '../services/api/building_api.dart';

class DetailViewModel with ChangeNotifier {
  BuildingData _detailBuilding = BuildingData();
  BuildingData get detailBuilding => _detailBuilding;

  Future getBuildingById(int id) async {
    try {
      final response = await BuildingApi.getBuildingById(id.toString());
      _detailBuilding = response;
      notifyListeners();
      return true;
    } catch (e) {
      return null;
    }
  }

  nearbyFacilityIcon(String jenis) {
    if (jenis == 'Transportasi') {
      return 'assets/svg/transportasi.svg';
    } else if (jenis == 'Pusat Perbelanjaan') {
      return 'assets/svg/mall.svg';
    } else if (jenis == 'Layanan') {
      return 'assets/svg/layanan.svg';
    } else if (jenis == 'Bisnis') {
      return 'assets/svg/bisnis.svg';
    } else if (jenis == 'Atraksi') {
      return 'assets/svg/atraksi.svg';
    } else if (jenis == 'Makanan dan Minuman') {
      return 'assets/svg/makanan.svg';
    }
  }

  double starProgressBar(List<Reviews> review, int star) {
    if (review.isNotEmpty) {
      var a = review.where((element) => element.rating == star).length;

      var hasil = a / review.length;
      return hasil;
    } else {
      return 0;
    }
  }
}
