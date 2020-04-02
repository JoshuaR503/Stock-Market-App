part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class FetchSearchHistory extends SearchEvent {}

class SaveSearch extends SearchEvent {

  final String symbol;

  SaveSearch({
    @required this.symbol
  });
}

class DeleteSearch extends SearchEvent {

  final SearchHistory symbol;

  DeleteSearch({
    @required this.symbol
  });
}
