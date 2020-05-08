import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/respository/search/search_client.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final _client = SearchClient();

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    
    if (event is FetchSearchHistory) {
      yield SearchLoading();
      yield* _fetchSavedSearches();
    }

    if (event is SaveSearch) {
      await this._client.save(symbol: event.symbol);
      yield* _fetchSavedSearches();
    }

    if (event is DeleteSearch) {
      await this._client.delete(symbol: event.symbol);
      yield* _fetchSavedSearches();
    }

     if (event is FetchSearchResults) {
      yield SearchLoading();

      final hasConnection = await DataConnectionChecker().hasConnection;

      if (hasConnection) {
        yield* _fetchSearchResults(symbol: event.symbol);
      } else {
        yield SearchResultsLoadingError(message: 'No internet connection');
      }
    }
  }

  Stream<SearchState> _fetchSavedSearches() async* {

    yield SearchLoading();

    final data = await this._client.fetch();
    
    yield data.isEmpty 
    ? SearchResultsLoadingError(message: 'No recent searches')
    : SearchData(data: data, listType: ListType.searchHistory);
  }


  Stream<SearchState> _fetchSearchResults({String symbol}) async* {
    try {
      final data = await this._client.searchStock(symbol: symbol);

      yield data.isEmpty 
      ? SearchResultsLoadingError(message: 'No results were found')
      : SearchData(data: data, listType: ListType.searchResults);

    } catch (e, stack) {
      yield SearchResultsLoadingError(message: 'There was an error loading');
      await SentryHelper(exception: e,  stackTrace: stack).report();
    }
  }
}