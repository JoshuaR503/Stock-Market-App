
import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_overview.dart';
import 'package:sma/respository/portfolio/client.dart';

class PortfolioRepository {

  Future<bool> isMarketOpen() async {
    return await PortfolioClient.isMarketOpen();
  }

  Future<StockOverview> fetchProfile({String symbol}) async {
    return await PortfolioClient.fetchProfile(symbol: symbol);
  }

  Future<MarketIndex> fetchMarketIndex({String symbol}) async {
    return await PortfolioClient.fetchMarketIndex(symbol: symbol);
  }
  
}