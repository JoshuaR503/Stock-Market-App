import 'package:dio/dio.dart';

import 'package:sma/helpers/http_helper.dart';

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

    return SectorPerformanceModel(
      performanceModelToday: SectorPerformanceDataModel.fromJson(response.data['Rank A: Real-Time Performance']),
    );
  }

  /// Fetches market most active stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketActive() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/stock/actives');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostActiveStock'])
    );
  }

  /// Fetches market most gainer stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketGainers() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/stock/gainers');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostGainerStock'])
    );
  }

  /// Fetches market most loser stocks and retuns [MarketMoversModelData].
  Future<MarketMoversModelData> fetchMarketLosers() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/stock/losers');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostLoserStock'])
    );
  }
}