import 'package:dio/dio.dart';
import 'package:sma/keys/api_keys.dart';

class FetchClient {
  Future<Response> fetchData({Uri uri}) async {
    return await Dio().getUri(uri);
  }

  Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await Dio().postUri(uri, data: data);
  }

  // Makes an HTTP request to any endpoint from Financial Modeling Prep API.
  Future<Response> financialModelRequest(String endpoint ) async {
    final Uri uri = Uri.https('financialmodelingprep.com', endpoint, {
      'apikey': kFinancialModelingPrepApi
    });
    
    return await Dio().getUri(uri);
  }
}
