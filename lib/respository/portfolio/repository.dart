
import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_profile.dart';
import 'package:sma/respository/portfolio/api_client.dart';

class PortfolioRepository {

  Future<StockProfile> fetchProfile({String symbol}) async {
    return await PortfolioClient.fetchProfile(symbol: symbol);
  }

  Future<MarketIndex> fetchMarketIndex({String symbol}) async {
    return await PortfolioClient.fetchMarketIndex(symbol: symbol);
  }
  
}