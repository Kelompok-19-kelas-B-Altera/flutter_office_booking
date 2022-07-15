import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_office_booking/models/building_model.dart';
import 'package:flutter_office_booking/models/search_building_model.dart';

class BuildingApi {
  final Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000, // 30 seconds
        receiveTimeout: 30 * 1000 // 30 seconds
        ),
  );

  Future getAllBuilding() async {
    try {
      final response = await dio.get('http://108.136.240.248/api/v1/building');

      print(response.data['data']);
      var buildings = BuildingModel.fromJson(response.data);
      return buildings.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  getBuildingById(String id) async {
    try {
      var response =
          await dio.get('http://108.136.240.248/api/v1/building/' + id);
      BuildingData buildingData = BuildingData.fromJson(response.data['data']);
      print(buildingData.buildingName);
      print(buildingData.address);
      print('buildingData.address');
      return buildingData;
    } on DioError catch (e) {
      rethrow;
    }
  }

  postSearchBuildings(String value) async {
    try {
      var data = {
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

      var jsonData = json.encode(data);
      final response = await dio.post(
        'http://108.136.240.248/api/v1/building/search',
        data: jsonData,
      );

      var searchData = SearchBuildingModel.fromJson(response.data);
      print(searchData.data!.content!);
      return searchData.data!.content;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e);
        return null;
      }
    }
  }
}
