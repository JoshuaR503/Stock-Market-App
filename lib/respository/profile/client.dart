import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/models/profile/rating.dart';
import 'package:sma/models/profile/stock_color.dart';
import 'package:sma/shared/colors.dart';

class ProfileClient {

  static String _authority = 'financialmodelingprep.com';

  static Future<StockQuote> fetchQuote({String symbol}) async {
    final Uri uri = Uri.https(_authority, '/api/v3/quote/$symbol');

    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final quote = StockQuote.fromJson(response.data[0]);    

    return quote;
  }

  static Future<CompanyProfile> fetchProfile({String symbol}) async {
    final Uri uri = Uri.https(_authority, '/api/v3/company/profile/$symbol');

    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final profile = CompanyProfile.fromJson(response.data['profile']);

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
