part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadingError extends ProfileState {
  final dynamic error;

  ProfileLoadingError({
    @required this.error
  });
}

class ProfileLoaded extends ProfileState {

  final StockQuote quote;
  final CompanyProfile profile;
  final StockRating rating;

  ProfileLoaded({
    @required this.quote,
    @required this.profile,
    @required this.rating
  });
}