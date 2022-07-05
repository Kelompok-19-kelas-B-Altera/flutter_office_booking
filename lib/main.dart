import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/view_models/building_view_model.dart';
import 'package:flutter_office_booking/view_models/detail_view_model.dart';
import 'package:flutter_office_booking/view_models/review_view_model.dart';
import 'package:flutter_office_booking/views/screens/detail_screen.dart';
import 'package:flutter_office_booking/views/screens/main_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
          ChangeNotifierProvider(create: (ctx) => BuildingViewModel()),
          ChangeNotifierProvider(create: (ctx) => DetailViewModel()),
          ChangeNotifierProvider(create: (ctx) => ReviewViewModel()),
        ],
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );
  }
}
