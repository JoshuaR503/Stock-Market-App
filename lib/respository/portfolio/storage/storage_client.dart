import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database_helper.dart';

class PortfolioStorageClient {

  final StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('hisss');

  // Sembast Database.
  Future<Database> get _database async => await DatabaseManager.instance.database;

  // Gets all the symbols storaged.
  Future<List<String>> fetch() async {

    final Finder finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(await _database, finder: finder);

    return response
    .map((x) => x.value['symbol'].toString())
    .toList();
  }

  // Checks if a symbol already exists in the Database.
  Future<bool> symbolExists({String symbol}) async {

    final finder = Finder(filter: Filter.matches('symbol', symbol));
    final response = await _store.findKey(await _database, finder: finder);

    return response != null;
  }

  // Saves a symbol in the database.
  Future<int> save({String symbol}) async {

    final bool isSaved = await symbolExists(symbol: symbol);

    if (!isSaved) {
      final Map<String, String> data = {'symbol': symbol};
      final int response = await _store.add(await _database, data);

      return response;
    }

    return 1;
  }

  // Deletes a symbol from the database.
  Future<int> delete({String symbol}) async {

    final finder = Finder(filter: Filter.matches('symbol', symbol));
    final response = await _store.findKey(await _database, finder: finder);
    final deleteFinder = Finder(filter: Filter.byKey(response));

    return await _store.delete(await _database, finder: deleteFinder);
  }

}