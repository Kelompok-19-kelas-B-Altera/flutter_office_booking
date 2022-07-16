import 'dart:convert';
import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../models/building_model.dart';
import '../../models/search_building_model.dart';

class BuildingApi {
  final Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000),
  );

  Future getAllBuilding() async {
    try {
      final response = await dio.get(baseUrl + 'api/v1/building');

      final BuildingModel buildings = BuildingModel.fromJson(response.data);
      return buildings.data;
    } on DioError {
      rethrow;
    }
  }

  getBuildingById(String id) async {
    try {
      final Response response =
          await dio.get(baseUrl + 'api/v1/building/' + id);
      final BuildingData buildingData =
          BuildingData.fromJson(response.data['data']);
      return buildingData;
    } on DioError {
      rethrow;
    }
  }

  postSearchBuildings(String value) async {
    try {
      final Map<String, List<dynamic>?> data = {
        "filters": [
          {
            "key": "buildingName",
            "operator": "LIKE",
            "field_type": "STRING",
            "value": value
          }
        ],
        "sorts": [],
        "page": null,
        "size": null
      };

      final String jsonData = json.encode(data);
      final Response response = await dio.post(
        baseUrl + 'api/v1/building/search',
        data: jsonData,
      );

      SearchBuildingModel searchData =
          SearchBuildingModel.fromJson(response.data);

      return searchData.data!.content;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return null;
      }
    }
  }
}
