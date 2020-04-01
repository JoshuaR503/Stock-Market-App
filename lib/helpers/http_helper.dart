import 'package:dio/dio.dart';
import 'package:sma/helpers/variables.dart';

class FetchClient {
  static Future<Response> fetchData({Uri uri}) async {
    return await Dio().getUri(uri);
  }

  static Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await Dio().postUri(uri, data: data);
  }

  static Future<bool> isMarketOpen() async {
    final Uri uri = Uri.https(authority, '/api/v3/is-the-market-open');
    final response = await fetchData(uri: uri);
    
    return response.data['isTheStockMarketOpen'];
  }
}
