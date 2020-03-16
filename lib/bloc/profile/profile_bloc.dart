import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
        yield ProfileLoaded(profile: await this._repository.fetchProfile(symbol: event.symbol));
      } catch (e) {
        print(e);
        yield ProfileLoadingError();
      }
    }
  }
}
