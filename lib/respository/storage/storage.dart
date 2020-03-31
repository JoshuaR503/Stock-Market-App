import 'package:sma/respository/storage/storage_client.dart';

class DatabaseRepository {

  // Client.
  final DatabaseClient _client = DatabaseClient();

  // Fetch all the data from the Databse Client.
  Future<List<String>> fetch() async {
    return await this._client.fetch();
  }

  Future<int> save({String symbol}) async {
    return await this._client.save(symbol: symbol);
  }

  Future<int> delete({String symbol}) async {
    return await this._client.delete(symbol: symbol);
  }

}