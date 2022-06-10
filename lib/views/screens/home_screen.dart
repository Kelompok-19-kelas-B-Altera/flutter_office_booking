import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_office_booking/views/widgets/most_view_card.dart';
import 'package:flutter_office_booking/views/widgets/recomendation_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 140,
                  ),
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return const MostViewCard();
                      },
                      separatorBuilder: (ctx, i) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 5,
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
                        return const RecomendationCard();
                      },
                      separatorBuilder: (ctx, i) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: 100,
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 3,
              child: Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
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
                              Color.fromARGB(255, 0, 119, 255),
                              Color.fromARGB(255, 131, 189, 255),
                            ]).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: Text(appName,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          const CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://picsum.photos/200/300'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        onEditingComplete: () {
                          print(_searchController.text);
                        },
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // enabled: false,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/svg/search.svg',
                                width: 10,
                                height: 10,
                              ),
                            ),
                            hintText: 'Cari Tempat atau Lokasi',
                            labelStyle: const TextStyle(color: Colors.black),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(0),
                            // ),
                            fillColor: Colors.grey[200]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
