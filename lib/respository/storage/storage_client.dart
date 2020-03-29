import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database.dart';

class DatabaseClient {

  final  StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('symbols');

  // Sembast Database.
  Future<Database> get _database async => await DatabaseManager.instance.database;

  // Gets all the symbols storaged.
  Future<List<String>> fetch() async {

    final response = await _store.find(
      await _database,
    );

    return response
    .map((f) => f.toString())
    .toList();
  }

  Future<void> save({String symbol}) async {
    return await _store.add(await _database, {'symbol': symbol});
  }

  Future<void> delete({String symbol}) async {

    final Finder finder = Finder(
      filter: Filter.equals('symbol', symbol)
    );

    await _store.delete(await _database, finder: finder);
  }

}