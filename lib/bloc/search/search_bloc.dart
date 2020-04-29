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
      yield* _fetchSavedSearches();
    }

    if (event is SaveSearch) {
      yield SearchLoading();
      await this._repository.save(symbol: event.symbol);
      yield* _fetchSavedSearches();
    }

    if (event is DeleteSearch) {
      yield SearchLoading();
      await this._repository.delete(symbol: event.symbol);
      yield* _fetchSavedSearches();
    }

     if (event is FetchSearchResults) {
      yield SearchLoading();
      yield* _connectionMiddleMan(symbol: event.symbol);
    }
  }

  Stream<SearchState> _fetchSavedSearches() async* {

    yield SearchLoading();

    final data = await this._repository.fetch();
    
    yield data.isEmpty 
    ? SearchResultsLoadingError(message: 'No recent searches')
    : SearchData(data: data, listType: ListType.searchHistory);
  }

  Stream<SearchState> _connectionMiddleMan({String symbol}) async* {
    final hasConnection =  await NetworkHelper().isConnected;

    if (hasConnection) {
      yield* _fetchSearchResults(symbol: symbol);
    } else {
      yield SearchResultsLoadingError(message: 'No internet connection');
    }
  }

  Stream<SearchState> _fetchSearchResults({String symbol}) async* {
    try {
      final data = await this._repository.searchStock(symbol: symbol);

      yield data.isEmpty 
      ? SearchResultsLoadingError(message: 'No results were found')
      : SearchData(data: data, listType: ListType.searchResults);

    } catch (e, stack) {
      yield SearchResultsLoadingError(message: 'There was an error loading');
      await SentryHelper(exception: e,  stackTrace: stack).report();
    }
  }
}