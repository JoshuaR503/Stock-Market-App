import 'package:sma/respository/storage/storage_client.dart';

class DatabaseRepository {

  // Client.
  final DatabaseClient _client = DatabaseClient();

  // Fetch all the data from the Databse Client.
  Future<List<String>> fetch() async {
    return await this._client.fetch();
  }



}