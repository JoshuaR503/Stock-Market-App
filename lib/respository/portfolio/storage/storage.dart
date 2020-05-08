// import 'package:sma/models/storage/storage.dart';
// import 'package:sma/respository/portfolio/storage/storage_client.dart';

// class PortfolioStorageRepository {

//   // Fetch all the data from the Databse Client.
//   Future<List<StorageModel>> fetch() async {
//     return await ().fetch();
//   }

//   // Save symbol in database.
//   Future<void> save({StorageModel storageModel}) async {
//     return await PortfolioStorageClient().save(storageModel: storageModel);
//   }

//   // Delete symbol from databse.
//   Future<void> delete({String symbol}) async {
//     return await PortfolioStorageClient().delete(symbol: symbol);
//   }

//   // Check if symbols exists in databse.
//   Future<bool> symbolExists({String symbol}) async {
//     return await PortfolioStorageClient().symbolExists(symbol: symbol);
//   }

// }