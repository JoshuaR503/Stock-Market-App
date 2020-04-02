import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database_helper.dart';
import 'package:sma/key.dart';

import 'package:sma/models/search/search.dart';
import 'package:sma/models/search/search_history.dart';

class SearchClient {

  static StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('hhh');

  static Future<List<StockSearch>> searchStock({String symbol}) async {

    final Uri uri = Uri.https('www.alphavantage.co', '/query', {
      'function': 'SYMBOL_SEARCH',
      'keywords': symbol,
      'apikey': alphavantageKey
    });

    final response = await Dio().getUri(uri);
    final data = response.data['bestMatches'];

    return StockSearch.convertToList(data);
  }
  
  static Future<Database> get _database async {
    return await DatabaseManager.instance.database;
  }

  static Future<void> save({String symbol}) async {
    await _store.add(await _database, {'symbol': symbol});
  }

  static Future<List<SearchHistory>> fetch() async {

    final finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(await _database, finder: finder);

    return response
    .map((snapshot) => SearchHistory(
      symbol: snapshot.value['symbol'].toString(), 
      id: snapshot.key
    ))
    .toList();
  }

  static Future<void> delete({SearchHistory symbol}) async {
    // Delete symbol from history.
    final filter = Filter.byKey(symbol.id);
    final finder = Finder( filter: filter);

    final result = await _store.delete(await _database, finder: finder);

    print(result);
  }
  
}