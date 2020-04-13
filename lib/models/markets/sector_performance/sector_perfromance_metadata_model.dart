import 'package:meta/meta.dart';

class SectorPerformanceMedataDatatModel {
  final String information;
  final String lastRefreshed;

  SectorPerformanceMedataDatatModel({
    @required this.information, 
    @required this.lastRefreshed
  });

  factory SectorPerformanceMedataDatatModel.fromJson(Map<String, dynamic> json) {
    return SectorPerformanceMedataDatatModel(
      information: json['Information'],
      lastRefreshed: json['Last Refreshed'],
    );
  }
}