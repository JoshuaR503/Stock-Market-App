import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sma/models/profile/profile.dart';
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
        final bool isMarketOpen = await this._repository.isMarketOpen();
        final ProfileModel profile = await this._repository.fetchProfile(symbol: event.symbol);
        
        yield ProfileLoaded(
          profileModel: profile,
          isMarketOpen: isMarketOpen
        );

      } catch (e) {
        yield ProfileLoadingError(error: 'There was an unknown error.');
      }
      
    }
  }
}
