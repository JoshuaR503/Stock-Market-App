part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioError extends PortfolioState {

  final String message;

  PortfolioError({
    @required this.message
  });
}

class PortfolioStockEmpty extends PortfolioState {

  final List<MarketIndexModel> indexes;

  PortfolioStockEmpty({
    @required this.indexes,
  });
}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {

  final List<StockOverviewModel> stocks;
  final List<MarketIndexModel> indexes;

  PortfolioLoaded({
    @required this.stocks,
    @required this.indexes,
  });
}
