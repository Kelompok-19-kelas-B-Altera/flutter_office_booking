import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatViewModel with ChangeNotifier {
  reFormatDate(String date) {
    DateFormat stringDate = DateFormat("dd-MM-yyyy HH:mm:ss");

    String formatedDate = DateFormat.MMMd().format(
      stringDate.parse(date),
    );

    return formatedDate;
  }
}
