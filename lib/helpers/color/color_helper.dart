import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

Color determineColorBasedOnChange(double change ) {
  return change < 0 
    ? kNegativeColor 
    : kPositiveColor;
}

TextStyle determineTextStyleBasedOnChange(double change ) {
  return change < 0 
    ?  kNegativeChange
    : kPositiveChange;
}

const TextStyle kPositiveChange = const TextStyle(
  color: kPositiveColor,
  fontSize: 16,
  fontWeight: FontWeight.w800
);

const TextStyle kNegativeChange = const TextStyle(
  color: kNegativeColor,
  fontSize: 16,
  fontWeight: FontWeight.w800
);
