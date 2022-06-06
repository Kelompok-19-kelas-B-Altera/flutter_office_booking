import 'package:flutter/material.dart';
import 'package:flutter_office_booking/views/screens/home_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexScreen = 0;
  List<Widget> listScreen = [
    HomeScreen(),
    SignInScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen[indexScreen],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexScreen,
          onTap: (value) {
            setState(() {
              indexScreen = value;
            });
            print(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ]),
    );
  }
}
