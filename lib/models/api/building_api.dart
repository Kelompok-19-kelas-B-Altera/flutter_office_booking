import 'package:dio/dio.dart';
import 'package:flutter_office_booking/models/building_model.dart';

class BuildingApi {
  static Future getAllBuilding() async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        );
    var dio = Dio(options);

    try {
      final response = await dio.get('http://108.136.240.248/api/v1/building');

      List<BuildingModel> buildings = (response.data['data'] as List)
          .map((e) => BuildingModel(
                id: e['id'],
                buildingName: e['building_name'],
                totalRoom: e['total_room'],
                roomSpace: e['room_space'],
                address: e['address'],
                imageUrl: e['image_url'],
                totalView: e['total_view'],
                complex: ComplexModel(
                  id: e['complex']['id'],
                  city: e['complex']['city'],
                ),
                nearbyFacilities: e['nearby_facilities'],
              ))
          .toList();
      return buildings;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e);
        return null;
      }
    }
  }

  static getBuildingById(String id) async {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        );
    var dio = Dio(options);

    try {
      var response =
          await dio.get('http://108.136.240.248/api/v1/building/' + id);
      print(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e);
        print('false');
      }
    }
  }
}
