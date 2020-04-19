part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class Search extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchHistoryLoaded extends SearchState {

  final List<StockSearch> symbols;

  SearchHistoryLoaded({
    @required this.symbols
  });
}

class SearchResults extends SearchState {

  final List<StockSearch> symbols;

  SearchResults({
    @required this.symbols
  });
}

class SearchResultsLoading extends SearchState {}

class SearchResultsLoadingError extends SearchState {}

class SearchResultsEmpty extends SearchState {}