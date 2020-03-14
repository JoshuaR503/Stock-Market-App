part of 'stocks_bloc.dart';

@immutable
abstract class StocksState {}

class StocksInitial extends StocksState {}

class StocksLoading extends StocksState {}

class StocksLoadingError extends StocksState {}

class StocksLoaded extends StocksState {

  final List<StockProfile> stocks;

  StocksLoaded({
    @required this.stocks
  });
}
