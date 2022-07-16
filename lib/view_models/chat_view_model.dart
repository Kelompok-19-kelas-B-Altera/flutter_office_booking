import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatViewModel with ChangeNotifier {
  DateFormat stringDate = DateFormat("dd-MM-yyyy HH:mm:ss");

  parseMessageDate(date) {
    if (stringDate.parse(date).day == DateTime.now().day &&
        stringDate.parse(date).month == DateTime.now().month &&
        stringDate.parse(date).year == DateTime.now().year) {
      const String result = 'Hari ini';

      return result;
    } else {
      final String result = DateFormat.yMMMMd().format(
        stringDate.parse(date),
      );

      return result;
    }
  }

  reFormatDate(String date) {
    String formatedDate = DateFormat.MMMd().format(stringDate.parse(date));

    return formatedDate;
  }
}
