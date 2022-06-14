import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queryMedia = MediaQuery.of(context);
    return SizedBox(
      height: queryMedia.size.height * 0.145,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/images/img2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: queryMedia.size.width * 0.375,
            top: 20,
            child: const Text(
              'Sutari Mogo Tower',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: queryMedia.size.width * 0.375,
            top: 50,
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
          Positioned(
            left: queryMedia.size.width * 0.375,
            bottom: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(queryMedia.size.width * 0.5, 35),
              ),
              onPressed: () {},
              child: const Text('Lihat Detail'),
            ),
          ),
        ],
      ),
    );
  }
}
