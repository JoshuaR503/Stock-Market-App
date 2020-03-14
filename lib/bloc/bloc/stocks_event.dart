part of 'stocks_bloc.dart';

@immutable
abstract class StocksEvent {}

class FetchStocks extends StocksEvent {

  final List<String> symbols;

  FetchStocks({
    @required this.symbols
  });
  
}