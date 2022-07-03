import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../models/building_model.dart';
import '../../view_models/building_view_model.dart';
import '../../view_models/detail_view_model.dart';

class RatingBuilding extends StatelessWidget {
  const RatingBuilding({
    Key? key,
    required this.dataBuilding,
  }) : super(key: key);

  final Data dataBuilding;

  @override
  Widget build(BuildContext context) {
    final buildingProvider = Provider.of<BuildingViewModel>(context);
    final detailProvider = Provider.of<DetailViewModel>(context);
    final queryMedia = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    buildingProvider.review(dataBuilding.reviews!) != 0
                        ? buildingProvider
                            .review(dataBuilding.reviews!)
                            .toStringAsFixed(1)
                        : '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    ' / 5',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${dataBuilding.reviews!.length}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    ' rating',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/star.svg',
                    height: 35,
                    color: buildingProvider.review(dataBuilding.reviews!) <= 1
                        ? Colors.grey[400]
                        : starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg/star.svg',
                    height: 35,
                    color: buildingProvider.review(dataBuilding.reviews!) <= 2
                        ? Colors.grey[400]
                        : starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg/star.svg',
                    height: 35,
                    color: buildingProvider.review(dataBuilding.reviews!) <= 3
                        ? Colors.grey[400]
                        : starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg/star.svg',
                    height: 35,
                    color: buildingProvider.review(dataBuilding.reviews!) <= 4
                        ? Colors.grey[400]
                        : starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg/star.svg',
                    height: 35,
                    color: buildingProvider.review(dataBuilding.reviews!) <= 5
                        ? Colors.grey[400]
                        : starColor,
                  ),
                ],
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: queryMedia.size.width * 0.3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      valueColor: AlwaysStoppedAnimation<Color>(starColor),
                      value: detailProvider.starProgressBar(
                        dataBuilding.reviews!,
                        5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${dataBuilding.reviews!.where((element) => element.rating == 5).length}',
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '4',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: queryMedia.size.width * 0.3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      valueColor: AlwaysStoppedAnimation<Color>(starColor),
                      value: detailProvider.starProgressBar(
                        dataBuilding.reviews!,
                        4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${dataBuilding.reviews!.where((element) => element.rating == 4).length}',
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '3',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: queryMedia.size.width * 0.3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      valueColor: AlwaysStoppedAnimation<Color>(starColor),
                      value: detailProvider.starProgressBar(
                        dataBuilding.reviews!,
                        3,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${dataBuilding.reviews!.where((element) => element.rating == 3).length}',
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: queryMedia.size.width * 0.3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      valueColor: AlwaysStoppedAnimation<Color>(starColor),
                      value: detailProvider.starProgressBar(
                        dataBuilding.reviews!,
                        2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${dataBuilding.reviews!.where((element) => element.rating == 2).length}',
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: queryMedia.size.width * 0.3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      valueColor: AlwaysStoppedAnimation<Color>(starColor),
                      value: detailProvider.starProgressBar(
                        dataBuilding.reviews!,
                        1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${dataBuilding.reviews!.where((element) => element.rating == 1).length}',
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
