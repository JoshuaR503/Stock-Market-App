import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry.dart';
import 'package:sma/models/market_index.dart';
import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/respository/storage/storage.dart';

part 'indexes_event.dart';
part 'indexes_state.dart';

class IndexesBloc extends Bloc<IndexesEvent, IndexesState> {

  final _repository = PortfolioRepository();
  // final _databaseRepository = DatabaseRepository();

  @override
  IndexesState get initialState => IndexesInitial();

  @override
  Stream<IndexesState> mapEventToState(IndexesEvent event) async* {

    if (event is FetchIndexes) {

      yield IndexesLoading();

      try {

        final indexes = '^DJI,^IXIC,^GSPC'.split(',');        
        final List<MarketIndex> fetchedTndexes = await Future
          .wait(indexes
          .map((symbol) async => await this._repository.fetchMarketIndex(symbol: symbol)));

        yield IndexesLoaded( indexes: fetchedTndexes);
        
      } catch (e, stack) {

        await SentryHelper(
          exception: e, 
          stackTrace: stack
        ).report();
        
        yield IndexesLoadingError(error: e.toString());
      }
    }
  }
}
