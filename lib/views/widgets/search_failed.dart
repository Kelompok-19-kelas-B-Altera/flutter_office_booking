import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../views/widgets/recomendation_card.dart';
import '../../view_models/building_view_model.dart';
import '../../view_models/search_view_model.dart';

class SearchFailed extends StatelessWidget {
  const SearchFailed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context);
    final buildingProvider = Provider.of<BuildingViewModel>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svg/question.svg',
              height: 80,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              'Kantor tidak ditemukan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text(
              'Tidak menemukan hasil',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              '"${searchProvider.searched}"',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.grey[300],
            height: 5,
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Rekomendasi',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  var buildingData = buildingProvider.recomendedBuilding[i];
                  return RecomendationCard(
                    buildingId: buildingData.id!,
                    review: buildingData.reviews!,
                    imageUrl: buildingData.images!,
                    buildingName: buildingData.buildingName,
                    address: buildingData.address,
                    city: buildingData.complex!.city,
                  );
                },
                separatorBuilder: (ctx, i) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: buildingProvider.buildingData.length < 10
                    ? buildingProvider.buildingData.length
                    : 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
