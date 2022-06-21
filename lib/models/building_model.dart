class BuildingModel {
  final int id;
  final String buildingName;
  final int totalRoom;
  final int roomSpace;
  final String address;
  final String imageUrl;
  final int totalView;
  final ComplexModel complex;
  final List nearbyFacilities;

  BuildingModel({
    required this.id,
    required this.buildingName,
    required this.totalRoom,
    required this.roomSpace,
    required this.address,
    required this.imageUrl,
    required this.totalView,
    required this.complex,
    required this.nearbyFacilities,
  });
}

class ComplexModel {
  final int id;
  final String city;

  ComplexModel({
    required this.id,
    required this.city,
  });
}
