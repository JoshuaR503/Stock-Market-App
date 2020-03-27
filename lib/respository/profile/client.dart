import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/profile/profile.dart';

import 'package:sma/models/profile/stock_color.dart';
import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/models/profile/stock_rating.dart';

import 'package:sma/shared/colors.dart';

class ProfileClient {

  static String _authority = 'financialmodelingprep.com';

  static Future<bool> isMarketOpen() async {
    final Uri uri = Uri.https(_authority, '/api/v3/is-the-market-open');
    final response = await FetchClient.fetchData(uri: uri);

    return response.data['isTheStockMarketOpen'];
  }

  static Future<ProfileModel> fetchProfile({String symbol}) async {
    final Uri quoteUri = Uri.https(_authority, '/api/v3/quote/$symbol');
    final Uri profileUri = Uri.https(_authority, '/api/v3/company/profile/$symbol');

    return ProfileModel(
      stockQuote: await _fetchQuote(uri: quoteUri),
      stockProfile: await _fetchProfile(uri: profileUri),
    );
  }

  static Future<StockQuote> _fetchQuote({Uri uri}) async {
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final quote = StockQuote.fromJson(response.data[0]);

    return quote;
  }

  static Future<StockProfile> _fetchProfile({Uri uri}) async {
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final profile = StockProfile.fromJson(response.data['profile']);

    return profile;
  }

  static Future<StockRating> fetchRating({String symbol}) async {
    final Uri uri = Uri.https(_authority, '/api/v3/company/rating/$symbol');

    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final rating = StockRating.fromJson(response.data);

    return rating;
  }

  static Future<Color> fetchChange({String symbol}) async {
    final Uri uri = Uri.https(_authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final quote = StockChangeColor.fromJson(response.data[0]);

    if (quote.changesPercentage < 0) {
      return kNegativeColor;
    }

    return kPositiveColor;
  }
}
