import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database_helper.dart';
import 'package:sma/models/storage/storage.dart';

class PortfolioStorageClient {

  final StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('portfolio_storage_client');

  // Sembast Database.
  Future<Database> get _database async => await DatabaseManager.instance.database;

  // Gets all the symbols stored.
  Future<List<StorageModel>> fetch() async {

    final Finder finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(await _database, finder: finder);

    return response
    .map((snapshot) => StorageModel.fromJson(snapshot.value))
    .toList();
  }

  // Checks if a symbol already exists in the Database.
  Future<bool> symbolExists({String symbol}) async {

    final finder = Finder(filter: Filter.matches('symbol', symbol));
    final response = await _store.findKey(await _database, finder: finder);

    return response != null;
  }

  // Saves a symbol in the database.
  Future<void> save({StorageModel storageModel}) async {
    
    final bool isSaved = await symbolExists(symbol: storageModel.symbol);

    if (!isSaved) {
      await _store.add(await _database, storageModel.toJson());
    }
  }

  // Deletes a symbol from the database.
  Future<void> delete({String symbol}) async {

    final finder = Finder(filter: Filter.matches('symbol', symbol));
    final response = await _store.findKey(await _database, finder: finder);
    final deleteFinder = Finder(filter: Filter.byKey(response));

    return await _store.delete(await _database, finder: deleteFinder);
  }

}