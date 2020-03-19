import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/models/profile/rating.dart';

class ProfileClient {

  static String _authority = 'financialmodelingprep.com';
  static Future<StockQuote> fetchQuote({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/quote/${symbol.toUpperCase()}');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    final data = response.data[0];
    final quote = StockQuote.fromJson(data);

    return quote;
  }

  static Future<CompanyProfile> fetchProfile({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/company/profile/${symbol.toUpperCase()}');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    final data = response.data;
    final profile = CompanyProfile.fromJson(data['profile']);

    return profile;
  }

  static Future<StockRating> fetchRating({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/company/rating/${symbol.toUpperCase()}');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    final data = response.data;
    final profile = StockRating.fromJson(data);

    return profile;
  }
}