import 'package:dio/dio.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/models/profile/market_index.dart';

class PortfolioClient extends FetchClient {

  Future<List<MarketIndexModel>> fetchIndexes() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/quote/^DJI,^GSPC,^IXIC,^RUT,^VIX');
    return MarketIndexModel.toList(response.data);
  }

  Future<StockOverviewModel> fetchStocks({String symbol}) async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/quote/$symbol');
    return StockOverviewModel.fromJson(response.data[0]);
  }
}