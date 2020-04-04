import 'package:dio/dio.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/models/data_overview.dart';

class PortfolioClient {

  Future<bool> isMarketOpen() async {
    final Uri uri = Uri.https(authority, '/api/v3/is-the-market-open');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    
    return response.data['isTheStockMarketOpen'];
  }

  Future<DataOverview> fetchData({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);

    if (response.statusCode != 200 ) {
      throw Exception('There was an error while making the HTTP call');
    }

    final data = response.data[0];
    final DataOverview stockProfile = DataOverview.fromJson(data);

    return stockProfile;
  }
}