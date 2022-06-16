import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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

  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'assets/images/img.png',
      'assets/images/img2.png',
      'assets/images/img.png',
      'assets/images/img2.png',
    ];
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
                    'Guardian Office',
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
                    onPressed: () {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
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
                    items: list
                        .map(
                          (item) => Container(
                            child: Image.asset(
                              item,
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
                        for (var i = 0; i < list.length; i++) {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hailmon Comp',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
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
                  const Text(
                    'Cilandak, Jakarta Selatan',
                    style: TextStyle(
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
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  Text(
                    '4.1',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(fontSize: 14),
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
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: SvgPicture.asset(
                  'assets/svg/arrow_down.svg',
                  color: Colors.grey,
                ),
              ),
              title: Text('Bandara Halim Perdana'),
              subtitle: Text('Transportasi'),
              trailing: Text('1 KM'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: SvgPicture.asset(
                  'assets/svg/chat.svg',
                  color: Colors.grey,
                ),
              ),
              title: Text('Rumah Sakit Mama Papa'),
              subtitle: Text('Layanan'),
              trailing: Text('1 KM'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: Colors.grey,
                ),
              ),
              title: Text('Dunia Fantasi'),
              subtitle: Text('Atraksi'),
              trailing: Text('1 KM'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.grey[300],
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
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
                        children: const [
                          Text(
                            '0',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
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
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 35,
                            color: Colors.grey[400],
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
                          const Text('0'),
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
                          const Text('0'),
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
                          const Text('0'),
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
                          const Text('0'),
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
                          const Text('0'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Lihat riview'),
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
