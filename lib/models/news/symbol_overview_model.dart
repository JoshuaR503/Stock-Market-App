import 'package:meta/meta.dart';

class SymbolOverviewModel {
  final String name;
  final double changesPercentage;
  final double change;

  SymbolOverviewModel({
    @required this.name,
    @required this.changesPercentage,
    @required this.change
  });

  factory SymbolOverviewModel.fromJson(Map<String, dynamic> json) {
    return SymbolOverviewModel(
      name: json['name'],
      changesPercentage: json['changesPercentage'],
      change: json['change'],
    );
  }
}
