import 'package:sma/models/search/search.dart';
import 'package:sma/respository/search/search_client.dart';

class SearchStockRepository extends SearchClient{

  Future<List<StockSearch>> searchStock({String symbol}) async {
    return await super.searchStock(symbol: symbol);
  }

  Future<List<StockSearch>> fetch() async {
    return await super.fetch();
  }

  Future<void> save({String symbol}) async {
    await super.save(symbol: symbol);
  }

  Future<void> delete({String symbol}) async {
    await super.delete(symbol: symbol);
  }
  
}
