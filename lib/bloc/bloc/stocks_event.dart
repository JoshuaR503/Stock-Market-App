part of 'stocks_bloc.dart';

@immutable
abstract class StocksEvent {}

class FetchStocks extends StocksEvent {

  final String symbol;

  FetchStocks({
    @required this.symbol,
  });
  
}