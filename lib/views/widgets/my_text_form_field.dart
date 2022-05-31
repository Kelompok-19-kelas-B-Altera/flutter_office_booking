import 'package:flutter/material.dart';

Widget myTextFormField({
  required var myController,
  required String? Function(String?)? myValidator,
  required var myObsecureText,
  required var myHintText,
  required var myLabelText,
}) {
  return TextFormField(
    controller: myController,
    validator: myValidator,
    obscureText: myObsecureText,
    decoration: InputDecoration(
      hintText: myHintText,
      labelText: myLabelText,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 3),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      labelStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
  );
}
