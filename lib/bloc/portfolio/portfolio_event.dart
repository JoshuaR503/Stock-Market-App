part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioEvent {}

class FetchPortfolioData extends PortfolioEvent {}

class SaveProfile extends PortfolioEvent {

  final StorageModel storageModel;

  SaveProfile({
    @required this.storageModel
  });
}

class DeleteProfile extends PortfolioEvent {

  final String symbol;

  DeleteProfile({
    @required this.symbol
  });
}