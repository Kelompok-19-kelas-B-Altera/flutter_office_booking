import 'package:flutter/material.dart';
import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_up_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryMedia = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: queryMedia.size.height * 0.13,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        queryMedia.size.width * 0.9,
                        queryMedia.size.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text('Masuk'),
                  ),
                ),
              ),
              Positioned(
                bottom: queryMedia.size.height * 0.05,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(
                        queryMedia.size.width * 0.9,
                        queryMedia.size.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: queryMedia.size.height * 0.05,
                child: const Text(
                  'Akun',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: queryMedia.size.height * 0.12,
                left: queryMedia.size.width * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Temukan pusat kantor terbaik di Jakarta',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Cari tempat kantor dimanapun yang kamu inginkan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
