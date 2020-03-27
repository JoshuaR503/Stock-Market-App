import 'dart:ui';

import 'package:sma/models/profile/index.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<ProfileModel> fetchProfile({String symbol}) async {
    return await ProfileClient.fetchProfile(symbol: symbol.toUpperCase());
  }

  Future<StockRating> fetchRating({String symbol}) async {
    return await ProfileClient.fetchRating(symbol: symbol.toUpperCase());
  }

  Future<Color> fetchChange({String symbol}) async {
    return await ProfileClient.fetchChange(symbol: symbol);
  }

}