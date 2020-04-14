part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioEvent {}

class FetchPortfolioData extends PortfolioEvent {}

class SaveProfile extends PortfolioEvent {

  final String symbol;

  SaveProfile({
    @required this.symbol
  });
}

class DeleteProfile extends PortfolioEvent {

  final String symbol;

  DeleteProfile({
    @required this.symbol
  });
}