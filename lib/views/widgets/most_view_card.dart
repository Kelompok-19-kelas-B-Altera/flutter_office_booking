import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_office_booking/models/building_model.dart';
import 'package:flutter_office_booking/view_models/building_view_model.dart';
import 'package:flutter_office_booking/view_models/detail_view_model.dart';
import 'package:flutter_office_booking/views/screens/detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MostViewCard extends StatelessWidget {
  const MostViewCard({
    Key? key,
    required this.buildingId,
    required this.review,
    required this.imageUrl,
    required this.buildingName,
    required this.address,
    required this.city,
  }) : super(key: key);

  final int buildingId;
  final List<Reviews> review;
  final List<ImagesModel> imageUrl;
  final String? buildingName;
  final String? address;
  final String? city;

  @override
  Widget build(BuildContext context) {
    var buildingProvider = Provider.of<BuildingViewModel>(context);
    var detailProvider = Provider.of<DetailViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: 200,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: imageUrl.isEmpty
                    ? Image.asset('assets/images/default_building.png')
                    : Image.network(
                        imageUrl[0].imageUrl!,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                buildingName!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/pin.svg',
                    width: 12,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      '$address, $city',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(7, 7, 35, 0.5),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 35),
                ),
                onPressed: () async {
                  await detailProvider.getBuildingById(buildingId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                        buildingId: buildingId,
                      ),
                    ),
                  );
                },
                child: const Text('Lihat Detail'),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    buildingProvider.review(review) != 0
                        ? buildingProvider.review(review).toStringAsFixed(1)
                        : '-',
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
