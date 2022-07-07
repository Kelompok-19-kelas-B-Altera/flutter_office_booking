import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/detail_screen.dart';
import 'package:flutter_office_booking/views/widgets/rating_building.dart';
import 'package:flutter_office_booking/views/widgets/write_review_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../view_models/building_view_model.dart';
import '../../view_models/detail_view_model.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    Key? key,
    required this.buildingId,
  }) : super(key: key);

  final int buildingId;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final queryMedia = MediaQuery.of(context);
    final detailProvider = Provider.of<DetailViewModel>(context);

    // var index = buildingProvider.buildingData
    //     .indexWhere((element) => element.id == buildingId);
    // var dataBuilding = buildingProvider.buildingData[index];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Material(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    'Review',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          RatingBuilding(dataBuilding: detailProvider.detailBuilding),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tulis Review',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Ceritakan pengalaman terbaikmu',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  onPressed: authViewModel.token != null
                      ? () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              isScrollControlled: true,
                              elevation: 10,
                              context: context,
                              builder: (ctx) {
                                return SingleChildScrollView(
                                  child: SizedBox(
                                    height: queryMedia.size.height * 0.9,
                                    child: WriteReviewBottomSheet(
                                        buildingId: buildingId,
                                        queryMedia: queryMedia),
                                  ),
                                );
                              });
                        }
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
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
          detailProvider.detailBuilding.reviews!.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/svg/not_found.svg',
                        height: 250,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Review tidak ditemukan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      width: 200,
                      child: Text(
                        'Ceritakan pengalaman terbaik mu ditempat ini',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Review',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: AssetImage(
                                            detailProvider.detailBuilding
                                                    .reviews![i].user?.images ??
                                                'assets/images/circle.png'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        detailProvider.detailBuilding
                                            .reviews![i].user!.fullname!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      for (int s = 0;
                                          s <
                                              detailProvider.detailBuilding
                                                  .reviews![i].rating!;
                                          s++)
                                        SvgPicture.asset(
                                          'assets/svg/star.svg',
                                          color: Colors.yellow,
                                          height: 15,
                                        ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      // Text('1 jam yang lalu')
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(detailProvider
                                      .detailBuilding.reviews![i].review!)
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, i) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              color: Colors.grey[300],
                              height: 5,
                            );
                          },
                          itemCount:
                              detailProvider.detailBuilding.reviews!.length),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
