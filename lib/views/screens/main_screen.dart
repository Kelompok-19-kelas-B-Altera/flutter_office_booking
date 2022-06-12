import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_booking/views/screens/account_screen.dart';
import 'package:flutter_office_booking/views/screens/home_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexScreen = 0;
  List<Widget> listScreen = [
    HomeScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: listScreen[indexScreen],
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          animation,
          secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: listScreen[indexScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexScreen,
          onTap: (value) {
            setState(() {
              indexScreen = value;
            });
            print(value);
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: Colors.blue,
              ),
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: Colors.grey,
              ),
              label: 'Utama',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/akun.svg',
                color: Colors.blue,
              ),
              icon: SvgPicture.asset(
                'assets/svg/akun.svg',
                color: Colors.grey,
              ),
              label: 'Akun',
            ),
          ]),
    );
  }
}
