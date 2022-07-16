import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/view_models/building_view_model.dart';
import 'package:flutter_office_booking/views/screens/account_screen.dart';
import 'package:flutter_office_booking/views/screens/chat_screen.dart';
import 'package:flutter_office_booking/views/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BuildingViewModel>(context, listen: false).getAllBuilding();
    });
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<BuildingViewModel>(context, listen: false).getAllBuilding();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  int indexScreen = 0;
  List<Widget> listScreen = [
    const HomeScreen(),
    const ChatScreen(),
    const AccountScreen(),
  ];

  List<BottomNavigationBarItem> listScreenBottomNav = [
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
        'assets/svg/chat.svg',
        color: Colors.blue,
      ),
      icon: SvgPicture.asset(
        'assets/svg/chat.svg',
        color: Colors.grey,
      ),
      label: 'Chats',
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
  ];

  List<Widget> noAuthListScreen = [
    const HomeScreen(),
    const AccountScreen(),
  ];

  List<BottomNavigationBarItem> noAuthListScreenBottomNav = [
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
  ];

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
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
        child: authProvider.token != null
            ? listScreen[indexScreen]
            : noAuthListScreen[indexScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexScreen,
        onTap: (value) {
          setState(() {
            indexScreen = value;
          });
        },
        items: authProvider.token != null
            ? listScreenBottomNav
            : noAuthListScreenBottomNav,
      ),
    );
  }
}
