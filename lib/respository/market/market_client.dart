import 'package:dio/dio.dart';

import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';

import 'package:sma/models/markets/market_active/market_active_model.dart';
import 'package:sma/models/markets/sector_performance/sector_performance_model.dart';

class MarketClient extends FetchClient {

  /// Fetches sector performance and returns [SectorPerformanceModel].
  Future<SectorPerformanceModel> fetchSectorPerformance() async {

    final Response<dynamic> response = await super.fetchData(
      uri: Uri.https('www.alphavantage.co', '/query', {
        'function': 'SECTOR',
        'apikey': 'demo'
      })
    );

    final data = response.data;

    return SectorPerformanceModel(
      performanceModelToday: SectorPerformanceDataModel.fromJson(data['Rank A: Real-Time Performance']),
    );

  }

  /// Fetches market most active stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketActive() async {
    final Uri uri = Uri.https(authority, '/api/v3/stock/actives');
    final Response<dynamic> response = await super.fetchData(uri: uri);
    
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostActiveStock'])
    );
  }

  /// Fetches market most gainer stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketGainers() async {
    final Uri uri = Uri.https(authority, '/api/v3/stock/gainers');
    final Response<dynamic> response = await super.fetchData(uri: uri);
    
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostGainerStock'])
    );
  }

  /// Fetches market most loser stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketLosers() async {
    final Uri uri = Uri.https(authority, '/api/v3/stock/losers');
    final Response<dynamic> response = await super.fetchData(uri: uri);
    
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostLoserStock'])
    );
  }
}