import 'package:sma/models/data_overview.dart';
import 'package:sma/models/profile/market_index.dart';
import 'package:sma/respository/portfolio/client.dart';

class PortfolioRepository {

  Future<DataOverview> fetchData({String symbol}) async {
    return await PortfolioClient().fetchData(symbol: symbol);
  }

  Future<List<MarketIndexModel>> fetchIndexes() async {
    return await PortfolioClient().fetchIndexes();
  }

}