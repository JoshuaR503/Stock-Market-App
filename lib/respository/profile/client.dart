import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/models/profile/profile.dart';

import 'package:sma/models/profile/stock_color.dart';
import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';

import 'package:sma/shared/colors.dart';

class ProfileClient {

  static Future<Map<String, dynamic>> fetchChanges({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    return {
      'price': response.data[0]['price'],
      'change': response.data[0]['change'],
      'changesPercentage': response.data[0]['changesPercentage'],
    };
  }
  
  static Future<Color> fetchChange({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);
    final quote = StockChangeColor.fromJson(response.data[0]);

    if (quote.changesPercentage < 0) {
      return kNegativeColor;
    }

    return kPositiveColor;
  }

  static Future<ProfileModel> fetchProfile({String symbol}) async {
    final Uri quoteUri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Uri profileUri = Uri.https(authority, '/api/v3/company/profile/$symbol');

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


}
