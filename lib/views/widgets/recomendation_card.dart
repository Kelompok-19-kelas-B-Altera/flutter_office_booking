import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/building_model.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    Key? key,
    required this.imageUrl,
    required this.buildingName,
    required this.address,
    required this.city,
  }) : super(key: key);

  final List<ImagesModel> imageUrl;
  final String? buildingName;
  final String? address;
  final String? city;

  @override
  Widget build(BuildContext context) {
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
              width: 192,
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
                      Text(
                        '4.1',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
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
                    onPressed: () {},
                    child: const Text('Lihat Detail'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
