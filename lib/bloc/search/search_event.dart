part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchNoConnection extends SearchEvent {}

class FetchSearchHistory extends SearchEvent {}

class FetchSearchResults extends SearchEvent {
  final String symbol;

  FetchSearchResults({
    @required this.symbol
  });
}

class SaveSearch extends SearchEvent {

  final String symbol;

  SaveSearch({
    @required this.symbol
  });
}

class DeleteSearch extends SearchEvent {

  final String symbol;

  DeleteSearch({
    @required this.symbol
  });
}
