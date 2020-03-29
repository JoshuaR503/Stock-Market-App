part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioEmpty extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoadingError extends PortfolioState {

  final dynamic error;

  PortfolioLoadingError({
    @required this.error
  });
}

class PortfolioLoaded extends PortfolioState {

  final List<StockOverview> stocks;
  final List<MarketIndex> indexes;

  PortfolioLoaded({
    @required this.stocks,
    @required this.indexes,
  });
}
