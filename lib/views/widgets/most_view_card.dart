import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostViewCard extends StatelessWidget {
  const MostViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: 200,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset('assets/images/img.png', fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Guardian Office',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
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
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 35),
                ),
                onPressed: () {},
                child: const Text('Lihat Detail'),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              color: Colors.white.withOpacity(0.7),
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
          ),
        ],
      ),
    );
  }
}
