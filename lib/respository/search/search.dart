
import 'package:sma/models/search/search.dart';
import 'package:sma/respository/search/search_client.dart';

class SearchStockRepository {
  Future<List<StockSearch>> searchStock({String symbol}) async {
    return await SearchClient.searchStock(symbol: symbol);
  }
}