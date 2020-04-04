import 'package:sma/respository/portfolio/storage/storage_client.dart';

class PortfolioStorageRepository {

  // Fetch all the data from the Databse Client.
  Future<List<String>> fetch() async {
    return await PortfolioStorageClient().fetch();
  }

  // Save symbol in database.
  Future<int> save({String symbol}) async {
    return await PortfolioStorageClient().save(symbol: symbol);
  }

  // Delete symbol from databse.
  Future<int> delete({String symbol}) async {
    return await PortfolioStorageClient().delete(symbol: symbol);
  }

  // Check if symbols exists in databse.
  Future<bool> symbolExists({String symbol}) async {
    return await PortfolioStorageClient().symbolExists(symbol: symbol);
  }

}