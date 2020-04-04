import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/respository/profile/repository.dart';
import 'package:sma/respository/storage/storage.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  
  final _repository = ProfileRepository();
  final _databaseRepository = DatabaseRepository();

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    
    if (event is FetchProfileData) {

      yield ProfileLoading();

      try {
        final bool isMarketOpen = false;
        final bool isSymbolSaved = await this._databaseRepository.symbolExists(symbol: event.symbol);
        final ProfileModel profile = await this._repository.fetchStockData(symbol: event.symbol);

        yield ProfileLoaded( 
          profileModel: profile, 
          isMarketOpen: isMarketOpen,
          isSymbolSaved: isSymbolSaved
        );

      } catch (e, stack) {

        await SentryHelper(exception: e,  stackTrace: stack).report();
        yield ProfileLoadingError(error: 'There was an unknown error.');
      }
    }
  }
}
