import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry.dart';
import 'package:sma/models/market_index.dart';
import 'package:sma/respository/portfolio/repository.dart';

part 'indexes_event.dart';
part 'indexes_state.dart';

class IndexesBloc extends Bloc<IndexesEvent, IndexesState> {

  @override
  IndexesState get initialState => IndexesInitial();

  @override
  Stream<IndexesState> mapEventToState(IndexesEvent event) async* {

    if (event is FetchIndexes) {
      yield IndexesLoading();

      try {
        yield IndexesLoaded( indexes: await _fetchFromNetwork());
        
      } catch (e, stack) {
        await SentryHelper(exception: e, stackTrace: stack).report();
        yield IndexesLoadingError(error: e.toString());
      }
    }
  }

  Future<List<MarketIndex>> _fetchFromNetwork() async {
    final repository = PortfolioRepository();
    final indexes = '^DJI,^IXIC,^GSPC'.split(',');        

    return await Future
      .wait(indexes
      .map((symbol) async => await repository.fetchMarketIndex(symbol: symbol)));
  }
}
