

import 'package:sma/models/stock_profile.dart';
import 'package:sma/respository/stocks/api_client.dart';

class StocksRepository {

  Future<StockProfile> fetchProfile({String symbol}) async {
    return await StockClient().fetchProfile(symbol);
  }
  
}