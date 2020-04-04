import 'package:sma/models/data_overview.dart';
import 'package:sma/respository/portfolio/client.dart';

class PortfolioRepository {
  Future<bool> isMarketOpen() async {
    return await PortfolioClient().isMarketOpen();
  }

  Future<DataOverview> fetchData({String symbol}) async {
    return await PortfolioClient().fetchData(symbol: symbol);
  }
}