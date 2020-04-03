import 'dart:ui';

import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/stock_chart.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<Map<String, dynamic>> fetchChanges({String symbol}) async {
    return await ProfileClient.fetchChanges(symbol: symbol);
  }

  Future<ProfileModel> fetchProfile({String symbol}) async {
    return await ProfileClient.fetchProfile(symbol: symbol.toUpperCase());
  }

  Future<Color> fetchChange({String symbol}) async {
    return await ProfileClient.fetchChange(symbol: symbol);
  }

  Future<List<StockChart>> fetchChart({String symbol}) async {
    return await ProfileClient.fetchChart(symbol: symbol);
  }
   
}