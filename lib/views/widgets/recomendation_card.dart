import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    Key? key,
    required this.imageUrl,
    required this.buildingName,
    required this.address,
    required this.city,
  }) : super(key: key);

  final String imageUrl;
  final String buildingName;
  final String address;
  final String city;

  @override
  Widget build(BuildContext context) {
    final queryMedia = MediaQuery.of(context);
    return SizedBox(
      height: queryMedia.size.height * 0.145,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: queryMedia.size.width * 0.375,
            top: 20,
            child: Text(
              buildingName,
              style: const TextStyle(
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
                Text(
                  '$address, $city',
                  style: const TextStyle(
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
