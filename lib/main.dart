import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/main_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
