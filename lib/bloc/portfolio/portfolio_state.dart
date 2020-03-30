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

  PortfolioLoaded({
    @required this.stocks,
  });
}

class ProfileSaving extends PortfolioState {}

class ProfileSavingError extends PortfolioState {
  final dynamic error;

  ProfileSavingError({
    @required this.error
  });
}

class ProfileSaved extends PortfolioState {}

