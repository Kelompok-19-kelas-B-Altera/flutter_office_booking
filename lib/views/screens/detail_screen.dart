import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/building_view_model.dart';
import '../../view_models/detail_view_model.dart';
import '../../views/screens/message_screen.dart';
import '../../views/screens/review_screen.dart';
import '../../views/screens/search_screen.dart';
import '../../views/widgets/rating_building.dart';
import '../../constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.buildingId,
  }) : super(key: key);

  final int buildingId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int lenghtFasilitas = 3;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthViewModel>(context);
    var buildingProvider = Provider.of<BuildingViewModel>(context);
    var detailProvider = Provider.of<DetailViewModel>(context);
    var queryMedia = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
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
                    'Detail Kantor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
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
                Positioned(
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/search.svg',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 300,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: detailProvider.detailBuilding.images!
                        .map(
                          (item) => Container(
                            child: Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 185,
                                      vertical: 125,
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: const CircularProgressIndicator()),
                                Image.network(
                                  item.imageUrl!,
                                  fit: BoxFit.cover,
                                  width: queryMedia.size.width,
                                ),
                              ],
                            ),
                            color: Colors.black,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(builder: (ctx) {
                        var isi = <Widget>[];
                        var index = 0;
                        for (var i = 0;
                            i < detailProvider.detailBuilding.images!.length;
                            i++) {
                          isi.add(
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          );
                          index += 1;
                        }
                        return Row(
                          children: isi,
                        );
                      }),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -5,
                  child: Container(
                    height: 30,
                    width: queryMedia.size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                detailProvider.detailBuilding.buildingName!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/pin.svg',
                    width: 12,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${detailProvider.detailBuilding.address}, ${detailProvider.detailBuilding.complex!.city}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(7, 7, 35, 0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: starColor,
                    size: 15,
                  ),
                  Text(
                    buildingProvider.review(
                                detailProvider.detailBuilding.reviews!) !=
                            0
                        ? buildingProvider
                            .review(detailProvider.detailBuilding.reviews!)
                            .toStringAsFixed(1)
                        : '-',
                    style: TextStyle(
                      color: starColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/room.svg'),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${detailProvider.detailBuilding.totalRoom}'),
                  const SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset('assets/svg/sum_person.svg'),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${detailProvider.detailBuilding.roomSpace}'),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                detailProvider.detailBuilding.description!,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              color: Colors.grey[300],
              height: 5,
            ),
            const SizedBox(
              height: 12,
            ),
            detailProvider.detailBuilding.nearbyFacilities!.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Fasilitas Umum Terdekat',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                child: SvgPicture.asset(
                                  detailProvider.nearbyFacilityIcon(
                                      detailProvider.detailBuilding
                                          .nearbyFacilities![i].type!),
                                ),
                              ),
                              title: Text(
                                detailProvider
                                    .detailBuilding.nearbyFacilities![i].name!,
                              ),
                              subtitle: Text(
                                detailProvider
                                    .detailBuilding.nearbyFacilities![i].type!,
                              ),
                              trailing: Text(
                                '${detailProvider.detailBuilding.nearbyFacilities![i].distance!} KM',
                              ),
                            );
                          },
                          separatorBuilder: (ctx, i) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                          itemCount: detailProvider.detailBuilding
                                      .nearbyFacilities!.length <=
                                  lenghtFasilitas
                              ? detailProvider
                                  .detailBuilding.nearbyFacilities!.length
                              : lenghtFasilitas),
                      detailProvider.detailBuilding.nearbyFacilities!.length < 3
                          ? Container()
                          : Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (lenghtFasilitas == 3) {
                                      lenghtFasilitas = detailProvider
                                          .detailBuilding
                                          .nearbyFacilities!
                                          .length;
                                    } else {
                                      lenghtFasilitas = 3;
                                    }
                                  });
                                },
                                child: lenghtFasilitas == 3
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('Lihat lainnya'),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SvgPicture.asset(
                                            'assets/svg/arrow_down.svg',
                                            height: 10,
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('Tutup lainnya'),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SvgPicture.asset(
                                            'assets/svg/arrow_up.svg',
                                            height: 16,
                                            width: 16,
                                          ),
                                        ],
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
                    ],
                  ),
            const SizedBox(
              height: 12,
            ),
            RatingBuilding(
              dataBuilding: detailProvider.detailBuilding,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) =>
                          ReviewScreen(buildingId: widget.buildingId),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      'Lihat Review',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    SvgPicture.asset(
                      'assets/svg/arrow_right.svg',
                      height: 15,
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(queryMedia.size.width * 0.1, 50)),
          onPressed: authProvider.token != null
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) {
                      return MessageScreen(
                          idUser: authProvider.userData!.id,
                          idBuilding: detailProvider.detailBuilding.id!,
                          alamat:
                              '${detailProvider.detailBuilding.address!}, ${detailProvider.detailBuilding.complex!.city}',
                          imgUrl:
                              detailProvider.detailBuilding.images!.isNotEmpty
                                  ? detailProvider
                                      .detailBuilding.images![0].imageUrl!
                                  : '',
                          buildingName:
                              detailProvider.detailBuilding.buildingName!);
                    }),
                  );
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/chat.svg'),
              const SizedBox(
                width: 15,
              ),
              const Text('Sewa Sekarang'),
            ],
          ),
        ),
      ),
    );
  }
}
