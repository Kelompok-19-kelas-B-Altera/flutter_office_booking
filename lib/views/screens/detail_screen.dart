import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/building_view_model.dart';
import 'package:flutter_office_booking/views/screens/review_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = 0;
  }

  int lenghtFasilitas = 3;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var buildingProvider = Provider.of<BuildingViewModel>(context);

    var i = buildingProvider.buildingData
        .indexWhere((element) => element.id == widget.id);
    var dataBuilding = buildingProvider.buildingData[i];
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
                Center(
                  child: Text(
                    dataBuilding.buildingName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                Positioned(
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
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
                    items: dataBuilding.images!
                        .map(
                          (item) => Container(
                            child: Image.network(
                              item.imageUrl!,
                              fit: BoxFit.cover,
                              width: queryMedia.size.width,
                            ),
                            color: Colors.green,
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
                        for (var i = 0; i < dataBuilding.images!.length; i++) {
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
                dataBuilding.buildingName!,
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
                    '${dataBuilding.address}, ${dataBuilding.complex!.city}',
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
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  Text(
                    buildingProvider.review(dataBuilding.reviews!) != 0
                        ? buildingProvider
                            .review(dataBuilding.reviews!)
                            .toStringAsFixed(1)
                        : '-',
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                dataBuilding.description!,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Fasilitas Umum Terdekat',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                        'assets/svg/arrow_down.svg',
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      dataBuilding.nearbyFacilities![i].name!,
                    ),
                    subtitle: Text(
                      dataBuilding.nearbyFacilities![i].type!,
                    ),
                    trailing: Text(
                      '${dataBuilding.nearbyFacilities![i].distance!} KM',
                    ),
                  );
                },
                separatorBuilder: (ctx, i) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: dataBuilding.nearbyFacilities!.length),
            dataBuilding.nearbyFacilities!.length < 3
                ? Container()
                : Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (lenghtFasilitas == 3) {
                            lenghtFasilitas = 5;
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
                                  'assets/svg/arrow_down.svg',
                                  height: 10,
                                  width: 10,
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
            const SizedBox(
              height: 12,
            ),
            Padding(
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
                            color: buildingProvider
                                        .review(dataBuilding.reviews!) <=
                                    1
                                ? Colors.grey[400]
                                : Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: buildingProvider
                                        .review(dataBuilding.reviews!) <=
                                    2
                                ? Colors.grey[400]
                                : Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: buildingProvider
                                        .review(dataBuilding.reviews!) <=
                                    3
                                ? Colors.grey[400]
                                : Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: buildingProvider
                                        .review(dataBuilding.reviews!) <=
                                    4
                                ? Colors.grey[400]
                                : Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: buildingProvider
                                        .review(dataBuilding.reviews!) <=
                                    5
                                ? Colors.grey[400]
                                : Colors.orange,
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
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
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
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                              value: 0.4,
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
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
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
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                              value: 0.4,
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
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
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
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                              value: 0.4,
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
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
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
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                              value: 0.4,
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
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
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
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                              value: 0.4,
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
                      builder: (ctx) => const ReviewScreen(),
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
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(queryMedia.size.width * 0.1, 50)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/chat.svg'),
              SizedBox(
                width: 15,
              ),
              Text('Sewa Sekarang'),
            ],
          ),
        ),
      ),
    );
  }
}
