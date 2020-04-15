

import 'package:intl/intl.dart';

String formatText(dynamic text ) {
  if (text != null) {
    return NumberFormat().format(text);
  } else {
    return '-';
  }
}

String compactText(dynamic text ) {
  return text != null
  ? NumberFormat.compact().format(text)
  : '-'; 
}

/// This function will add a + sign to an string
/// based on the [change].
String determineTextBasedOnChange(double change) {
  return change < 0 
    ? formatText(change) 
    : '+${formatText(change)}';
}

/// This function will add a + sign to an string
/// based on the [change].
String determineTextPercentageBasedOnChange(double change) {
  return change < 0 
    ? '${formatText(change)}%' 
    : '+${formatText(change)}%';
}