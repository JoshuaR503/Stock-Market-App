import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_overview.dart';

class PortfolioClient {

  static String _authority = 'financialmodelingprep.com';

  static Future<StockOverview> fetchProfile({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    if (response.statusCode != 200 ) {
      throw Exception('There was an error while making the HTTP call');
    }

    final data = response.data[0];
    final StockOverview stockProfile = StockOverview.fromJson(data);

    return stockProfile;
  }

  static Future<MarketIndex> fetchMarketIndex({String symbol}) async {

    final Uri uri = Uri.https(_authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient.fetchData(uri: uri);

    if (response.statusCode != 200 ) {
      throw Exception('There was an error while making the HTTP call');
    }

    final data = response.data[0];
    final MarketIndex marketIndex = MarketIndex.fromJson(data);

    return marketIndex;
  }
}