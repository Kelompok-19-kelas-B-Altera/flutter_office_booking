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
            // fit: StackFit.expand,
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
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
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
                            width: 1000,
                          ),
                          color: Colors.green,
                        ),
                      )
                      .toList(),
                ),
                Row(
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
                    // Container(
                    //   width: 8.0,
                    //   height: 8.0,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 4.0),
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: _current == 0 ? Colors.black : Colors.white),
                    // ),
                    // Container(
                    //   width: 8.0,
                    //   height: 8.0,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 4.0),
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: _current == 1 ? Colors.black : Colors.white),
                    // ),
                    // Container(
                    //   width: 8.0,
                    //   height: 8.0,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 4.0),
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: _current == 2 ? Colors.black : Colors.white),
                    // ),
                    // Container(
                    //   width: 8.0,
                    //   height: 8.0,
                    //   margin: const EdgeInsets.symmetric(
                    //       vertical: 8.0, horizontal: 4.0),
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: _current == 3 ? Colors.black : Colors.white),
                    // ),
                  ],
                ),
              ],
            )
            // CarouselSlider(
            //   items: [
            //     Image.asset(
            //       'assets/images/img.png',
            //       fit: BoxFit.cover,
            //       // height: 100,
            //     ),
            //     Image.asset(
            //       'assets/images/img.png',
            //       fit: BoxFit.cover,
            //       // height: 100,
            //     ),
            //     Image.asset(
            //       'assets/images/img.png',
            //       fit: BoxFit.cover,
            //       // height: 100,
            //     ),
            //     Image.asset('assets/images/img.png'),
            //     Image.asset('assets/images/img.png'),
            //     Image.asset('assets/images/img.png'),
            //   ],
            //   options: CarouselOptions(
            //     enlargeCenterPage: true,

            //     height: 300,
            //     aspectRatio: 16 / 9,
            //     viewportFraction: 0.8,
            //     initialPage: 0,
            //     enableInfiniteScroll: true,
            //     reverse: false,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeCenterPage: true,
            //     // onPageChanged: callbackFunction,
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            ),
      ),
      // SafeArea(
      //   child: Stack(children: [
      //     Material(
      //       color: Colors.transparent,
      //       elevation: 3,
      //       child: Container(
      //         height: queryMedia.size.width * 0.15,
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(10),
      //             bottomRight: Radius.circular(10),
      //           ),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(10),
      //           child: Row(
      //             children: [
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: const Icon(Icons.arrow_back_ios_new),
      //               ),
      //               const Expanded(
      //                 child: SizedBox(),
      //               ),
      //               const CircleAvatar(
      //                 backgroundImage:
      //                     NetworkImage('https://picsum.photos/200/300'),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}
