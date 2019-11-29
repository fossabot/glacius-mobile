import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateHelper {
  DateTime dateTime;

  DateHelper({@required this.dateTime});

  DateHelper.fromString({@required String dateTime})
      : dateTime = DateTime.parse(dateTime);

  @override
  String toString() {
    if (dateTime == null) {
      return null;
    }

    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
}
