
import 'package:sma/models/markets/market_active/market_active_model.dart';
import 'package:sma/models/markets/sector_performance/sector_performance_model.dart';
import 'package:sma/respository/market/market_client.dart';

class MarketRepository {
  
  Future<SectorPerformanceModel> fetchSectorPerformance() async {
    return await MarketClient().fetchSectorPerformance();
  }
  
  Future<MarketMoversModelData> fetchMarketActive() async {
    return await MarketClient().fetchMarketActive();
  }

  Future<MarketMoversModelData> fetchMarketGainers() async {
    return await MarketClient().fetchMarketGainers();
  }

  Future<MarketMoversModelData> fetchMarketLosers() async {
    return await MarketClient().fetchMarketLosers();
  }

}