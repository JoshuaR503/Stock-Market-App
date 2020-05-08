import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry_helper.dart';

import 'package:sma/models/markets/market_active/market_active_model.dart';
import 'package:sma/models/markets/sector_performance/sector_performance_model.dart';
import 'package:sma/respository/market/market_client.dart';

part 'sector_performance_event.dart';
part 'sector_performance_state.dart';

class SectorPerformanceBloc extends Bloc<SectorPerformanceEvent, SectorPerformanceState> {

  @override
  SectorPerformanceState get initialState => SectorPerformanceInitial();

  @override
  Stream<SectorPerformanceState> mapEventToState( SectorPerformanceEvent event ) async* {

    if (event is FetchSectorPerformance) {
      yield SectorPerformanceLoading();
      yield* _fetchData();
    }
  }

  Stream<SectorPerformanceState> _fetchData() async* {
    try {
      final client = MarketClient();

      yield SectorPerformanceLoaded(
        sectorPerformance: await client.fetchSectorPerformance(),
        marketActive: await client.fetchMarketActive(),
        marketGainer: await client.fetchMarketGainers(),
        marketLoser: await client.fetchMarketLosers()
      );
      
    } catch (e, stack) {
      await SentryHelper(exception: e,  stackTrace: stack).report();
      yield SectorPerformanceError(message: 'There was an unkwon error');
    }
  }
}
