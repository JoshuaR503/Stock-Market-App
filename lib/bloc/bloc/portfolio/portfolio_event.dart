part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioEvent {}

class FetchPortfoliData extends PortfolioEvent {

  final List<String> stockSymbols;
  final List<String> marketSymbols;

  FetchPortfoliData({
    @required this.stockSymbols,
    @required this.marketSymbols
  });
  
}