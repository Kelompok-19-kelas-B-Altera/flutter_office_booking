import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/building_view_model.dart';
import '../../views/screens/search_screen.dart';
import '../../views/widgets/most_view_card.dart';
import '../../views/widgets/recomendation_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buildingProvider = Provider.of<BuildingViewModel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(125),
        child: Material(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) =>
                            const LinearGradient(colors: [
                          Color.fromARGB(255, 0, 76, 162),
                          Color.fromARGB(255, 131, 189, 255),
                        ]).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: Text(appName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      authProvider.userData?.picUrl != null
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(authProvider.userData!.picUrl))
                          : const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                            ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/search.svg',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cari Tempat atau Lokasi...',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Banyak dilihat',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) {
                    var buildingData = buildingProvider.mostViewBuilding[i];

                    return MostViewCard(
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
                      width: 20,
                    );
                  },
                  itemCount: buildingProvider.mostViewBuilding.length,
                ),
              ),
              const Text(
                'Rekomendasi',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
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
                  itemCount: buildingProvider.recomendedBuilding.length < 10
                      ? buildingProvider.recomendedBuilding.length
                      : 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
