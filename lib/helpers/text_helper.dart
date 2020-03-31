

import 'package:intl/intl.dart';

String formatText(dynamic text ) {
  if (text != null) {
    return NumberFormat().format(text);
  } else {
    return '-';
  }
}