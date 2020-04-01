
import 'package:sma/models/search/search.dart';
import 'package:sma/respository/search/search_client.dart';

class SearchStockRepository {

  
  Future<List<StockSearch>> searchStock({String symbol}) async {
    return await SearchClient.searchStock(symbol: symbol);
  }

  Future<List<String>> fetch() async {
    return await SearchClient().fetch();
  }

  Future<void> save({String symbol}) async {
    await SearchClient().save(symbol: symbol);
  }


}