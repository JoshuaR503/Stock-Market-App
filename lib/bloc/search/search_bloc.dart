import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/network_helper.dart';
import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/respository/search/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchStockRepository _repository = SearchStockRepository();

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchSearchHistory) {
      yield SearchLoading();
      yield* _fetchSavedResults();
    }

    if (event is FetchSearchResults) {
      yield SearchLoading();
      yield* _fetchSearchResults(symbol: event.symbol);
    }

    if (event is SaveSearch) {
      await this._repository.save(symbol: event.symbol);
      yield* _fetchSavedResults();
    }

    if (event is DeleteSearch) {
      await this._repository.delete(symbol: event.symbol);
      yield* _fetchSavedResults();
    }
  }

  Stream<SearchState> _fetchSavedResults() async* {

    final hasConnection = await NetworkHelper().isConnected;

    if (hasConnection) {

      final data = await this._repository.fetch();

      if (data.isNotEmpty) {
        yield SearchHistoryLoaded(data: data);
      } else {
        yield SearchEmpty();
      }

    } else {
      yield SearchResultsLoadingError(message: 'No internet connection');
    }
  }

  Stream<SearchState> _fetchSearchResults({String symbol}) async* {
    try {
      yield SearchResults(data: await this._repository.searchStock(symbol: symbol));
    } catch (e, stack) {
      yield SearchResultsLoadingError(message: 'There was an error loading');
      await SentryHelper(exception: e,  stackTrace: stack).report();
    }
  }
}
