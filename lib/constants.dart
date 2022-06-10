import 'package:flutter/material.dart';

//API Url
String baseUrl = 'http://108.136.240.248';
// String baseUrl =
//     'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/';

//Color
Color colorPrimary = const Color.fromARGB(255, 255, 0, 0);
Color colorSecondary = const Color.fromARGB(255, 85, 255, 0);
Color colorTertiary = const Color.fromARGB(255, 144, 0, 255);

//Application Name
String appName = 'Officity';

//Validator
RegExp emailValidator = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
RegExp passwordValidator =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
