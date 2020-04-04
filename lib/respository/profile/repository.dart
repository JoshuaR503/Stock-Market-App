import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<StockQuote> fetchProfileChanges({String symbol}) async {
    return await ProfileClient().fetchProfileChanges(symbol: symbol);
  }

  Future<ProfileModel> fetchStockData({String symbol}) async {
    return await ProfileClient().fetchStockData(symbol: symbol);
  }

}