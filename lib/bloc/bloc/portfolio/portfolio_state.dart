part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoadingError extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {

  final List<StockProfile> stocks;
  final List<MarketIndex> indexes;

  PortfolioLoaded({
    @required this.stocks,
    @required this.indexes,
  });
}
