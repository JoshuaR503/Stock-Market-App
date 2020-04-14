

import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

Color determineColorBasedOnChange(double change ) {
  return change < 0 
    ? kRedColor 
    : kPositiveColor;
}