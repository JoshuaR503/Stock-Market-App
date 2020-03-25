import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sma/models/profile/profile.dart';

import 'package:sma/models/profile/quote.dart';
import 'package:sma/respository/profile/repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  
  final _repository = ProfileRepository();

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    
    if (event is FetchProfileData) {
      yield ProfileLoading();

      try {
        yield ProfileLoaded(
          quote: await this._repository.fetchQuote(symbol: event.symbol),
          profile: await this._repository.fetchProfile(symbol: event.symbol),
          // rating: await this._repository.fetchRating(symbol: event.symbol)
        );

      } catch (e) {
        print('There was an error @ profile_bloc: $e');
        yield ProfileLoadingError(error: e);
      }
    }
  }
}
