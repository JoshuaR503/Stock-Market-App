import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      yield* _fetch();
    }

    if (event is FetchSearchResults) {
      yield SearchLoading();
      yield* _fetchSearchResults(symbol: event.symbol);
    }

    if (event is SaveSearch) {
      await this._repository.save(symbol: event.symbol);
      yield* _fetch();
    }

    if (event is DeleteSearch) {
      await this._repository.delete(symbol: event.symbol);
      yield* _fetch();
    }
  }

  Stream<SearchState> _fetch() async* {
    final data = await this._repository.fetch();

    if (data.isNotEmpty) {
      yield SearchHistoryLoaded(symbols: data);
    } else {
      yield SearchEmpty();
    }
  }

  Stream<SearchState> _fetchSearchResults({String symbol}) async* {
    try {
      yield SearchResults(symbols: await this._repository.searchStock(symbol: symbol));
    } catch (e) {
      yield SearchResultsLoadingError();
    }
  }
}
