import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/building_model.dart';
import '../../view_models/building_view_model.dart';
import '../screens/detail_screen.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    Key? key,
    required this.id,
    required this.review,
    required this.imageUrl,
    required this.buildingName,
    required this.address,
    required this.city,
  }) : super(key: key);

  final int id;
  final List<Reviews> review;
  final List<ImagesModel> imageUrl;
  final String? buildingName;
  final String? address;
  final String? city;

  @override
  Widget build(BuildContext context) {
    var buildingProvider = Provider.of<BuildingViewModel>(context);

    final queryMedia = MediaQuery.of(context);

    return SizedBox(
        height: 140,
        width: queryMedia.size.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 140,
              width: 180,
              child: imageUrl.isEmpty
                  ? Image.asset('assets/images/default_building.png')
                  : Image.network(
                      imageUrl[0].imageUrl!,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: queryMedia.size.width * 0.45,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/star.svg',
                        width: 12,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        buildingProvider.review(review) != 0
                            ? buildingProvider.review(review).toStringAsFixed(1)
                            : '-',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    buildingName!,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/pin.svg',
                        width: 12,
                      ),
                      Text(
                        '$address, $city',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(7, 7, 35, 0.5),
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 35),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            id: id,
                          ),
                        ),
                      );
                    },
                    child: const Text('Lihat Detail'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
