import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';

import 'package:sma/key.dart';

class FetchClient {
  static Future<Response> fetchData({Uri uri}) async {
    try {
      return await Dio().getUri(uri);
      
    } catch (e, stackTrace) {

      SentryClient(dsn: sentryDNS).captureException(
        exception: e,
        stackTrace: stackTrace,
      );

      throw e;
    } 
  }

  static Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await Dio().postUri(uri, data: data);
  }
}
