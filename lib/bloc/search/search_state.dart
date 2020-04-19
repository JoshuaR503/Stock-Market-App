part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchHistoryLoaded extends SearchState {

  final List<StockSearch> data;

  SearchHistoryLoaded({
    @required this.data
  });
}

class SearchResults extends SearchState {

  final List<StockSearch> data;

  SearchResults({
    @required this.data
  });
}

class SearchResultsLoadingError extends SearchState {}
