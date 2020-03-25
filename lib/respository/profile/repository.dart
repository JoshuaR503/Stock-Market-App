import 'dart:ui';

import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/models/profile/rating.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<StockQuote> fetchQuote({String symbol}) async {
    return await ProfileClient.fetchQuote(symbol: symbol.toUpperCase());
  }
  
  Future<CompanyProfile> fetchProfile({String symbol}) async {
    return await ProfileClient.fetchProfile(symbol: symbol.toUpperCase());
  }

  Future<StockRating> fetchRating({String symbol}) async {
    return await ProfileClient.fetchRating(symbol: symbol.toUpperCase());
  }

  Future<Color> fetchChange({String symbol}) async {
    return await ProfileClient.fetchChange(symbol: symbol);
  }

}