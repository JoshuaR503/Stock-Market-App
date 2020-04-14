import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/profile/market_index.dart';
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
        final repository = PortfolioRepository();
        yield IndexesLoaded( indexes: await repository.fetchIndexes());
        
      } catch (e, stack) {
        await SentryHelper(exception: e, stackTrace: stack).report();
        yield IndexesLoadingError();
      }
    }
  }
}
