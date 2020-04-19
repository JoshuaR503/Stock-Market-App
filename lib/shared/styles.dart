import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

/// This is the common border radious of all the containers in the app.
const kStandatBorder = const BorderRadius.all(Radius.circular(6));

/// This border is slightly more sharp than the standard boder.
const kSharpBorder = const BorderRadius.all(Radius.circular(2));

/// This is the common text styling for a subtile. 
const kSubtitleStyling = const TextStyle(
  color: kGray,
  fontSize: 24,
  fontWeight: FontWeight.w800
);

/// This is the common text styling for a subtile. 
const kCompanyNameHeading = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800
);