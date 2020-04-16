import 'package:meta/meta.dart';

class StorageModel {
  
  final String symbol;
  final String companyName;

  StorageModel({
    @required this.symbol,
    @required this.companyName,
  });

  static List<StorageModel> convertToList(List<dynamic> items) {
    return items
    .map((item) => StorageModel.fromJson(item))
    .toList();
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['symbol'] = this.symbol;
    data['companyName'] = this.companyName;

    return data;
  }

  factory StorageModel.fromJson(Map<String, dynamic> json) {
    return StorageModel(
      symbol: json['symbol'],
      companyName: json['companyName'],
    );
  }
}