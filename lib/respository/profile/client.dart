import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/profile/quote.dart';

class ProfileClient {

  static String _authority = 'financialmodelingprep.com';
  static Future<StockQuote> fetchProfile({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/quote/${symbol.toUpperCase()}');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    final data = response.data[0];
    final quote = StockQuote.fromJson(data);

    return quote;
  }
}