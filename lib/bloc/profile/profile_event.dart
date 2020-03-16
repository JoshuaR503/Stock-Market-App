part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class FetchProfileData extends ProfileEvent {

  final String symbol;

  FetchProfileData({
    @required this.symbol
  });

}