import 'package:flutter_office_booking/models/building_model.dart';
import 'package:flutter_office_booking/services/api/building_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'building_api_test.mocks.dart';

@GenerateMocks([BuildingApi])
void main() {
  group('BuildingAPI', () {
    BuildingApi buildingApi = MockBuildingApi();
    test('get all building return data', () async {
      when(buildingApi.getAllBuilding())
          .thenAnswer((realInvocation) async => <BuildingData>[
                BuildingData(
                  id: 1,
                  buildingName: 'buildingName',
                  address: 'address',
                  complex: Complex(id: 1, city: 'Jakarta'),
                  description: 'Description',
                  images: [],
                  nearbyFacilities: [],
                  reviews: [],
                  schedules: [],
                  roomSpace: 1,
                  totalRoom: 4,
                  totalView: 10,
                ),
              ]);

      List buildings = await buildingApi.getAllBuilding();
      expect(buildings.isNotEmpty, true);
    });

    test('get building by id', () async {
      when(buildingApi.getBuildingById('1'))
          .thenAnswer((realInvocation) async => BuildingData(
                id: 1,
                buildingName: 'buildingName',
                address: 'address',
                complex: Complex(id: 1, city: 'Jakarta'),
                description: 'Description',
                images: [],
                nearbyFacilities: [],
                reviews: [],
                schedules: [],
                roomSpace: 1,
                totalRoom: 4,
                totalView: 10,
              ));

      BuildingData buildingData = await buildingApi.getBuildingById('1');
      expect(buildingData.id != null, true);
      expect(buildingData.buildingName != null, true);
      expect(buildingData.address != null, true);
      expect(buildingData.complex != null, true);
      expect(buildingData.description != null, true);
      expect(buildingData.images != null, true);
      expect(buildingData.reviews != null, true);
      expect(buildingData.schedules != null, true);
      expect(buildingData.roomSpace != null, true);
      expect(buildingData.totalRoom != null, true);
      expect(buildingData.totalRoom != null, true);
    });

    test('search building by name', () async {
      when(buildingApi.postSearchBuildings('buildingName'))
          .thenAnswer((realInvocation) async => <BuildingData>[
                BuildingData(
                  id: 1,
                  buildingName: 'buildingName',
                  address: 'address',
                  complex: Complex(id: 1, city: 'Jakarta'),
                  description: 'Description',
                  images: [],
                  nearbyFacilities: [],
                  reviews: [],
                  schedules: [],
                  roomSpace: 1,
                  totalRoom: 4,
                  totalView: 10,
                ),
              ]);

      List<BuildingData> buildings =
          await buildingApi.postSearchBuildings('buildingName');
      expect(buildings.isNotEmpty, true);
    });
  });
}
