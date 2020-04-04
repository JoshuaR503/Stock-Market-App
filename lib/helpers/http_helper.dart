import 'package:dio/dio.dart';
import 'package:sma/helpers/variables.dart';

class FetchClient {
  static Future<Response> fetchData({Uri uri}) async {
    return await Dio().getUri(uri);
  }

  static Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await Dio().postUri(uri, data: data);
  }


}
