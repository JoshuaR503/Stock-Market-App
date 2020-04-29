part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchData extends SearchState {

  final List<StockSearch> data;
  final ListType listType;

  SearchData({
    @required this.data,
    @required this.listType
  });
}


class SearchResultsLoadingError extends SearchState {
  final String  message;
  
  SearchResultsLoadingError({
    @required this.message
  });
}
