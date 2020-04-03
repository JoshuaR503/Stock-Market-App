import 'dart:ui';

import 'package:sma/models/profile/profile.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<Map<String, dynamic>> fetchChanges({String symbol}) async {
    return await ProfileClient().fetchChanges(symbol: symbol);
  }

  Future<ProfileModel> fetchStockData({String symbol}) async {
    return await ProfileClient().fetchStockData(symbol: symbol);
  }

  Future<Color> fetchChange({String symbol}) async {
    return await ProfileClient().fetchChange(symbol: symbol);
  }
}