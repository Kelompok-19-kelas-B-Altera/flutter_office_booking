import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/images/img2.png',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            left: 160,
            top: 20,
            child: Text(
              'Sutari Mogo Tower',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 160,
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
            left: 160,
            bottom: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 35),
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
