import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/respository/portfolio/repository.dart';

part 'indexes_event.dart';
part 'indexes_state.dart';

class IndexesBloc extends Bloc<IndexesEvent, IndexesState> {

  final _repository = PortfolioRepository();

  @override
  IndexesState get initialState => IndexesInitial();

  @override
  Stream<IndexesState> mapEventToState(IndexesEvent event) async* {

    if (event is FetchIndexes) {
      yield IndexesLoading();

      try {
        
        yield IndexesLoaded( 
          indexes: await _fetchFromNetwork(),
          isMarketOpen: await _repository.isMarketOpen()
        );
        
      } catch (e, stack) {
        await SentryHelper(exception: e, stackTrace: stack).report();
        yield IndexesLoadingError(error: e.toString());
      }
    }
  }

  Future<List<DataOverview>> _fetchFromNetwork() async {
    final indexes = '^DJI,^IXIC,^GSPC'.split(',');        

    return await Future
      .wait(indexes
      .map((symbol) async => await _repository.fetchData(symbol: symbol)));
  }
}
