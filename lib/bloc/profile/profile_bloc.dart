import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:sma/helpers/sentry_helper.dart';
import 'package:sma/models/profile/profile.dart';

import 'package:sma/respository/portfolio/storage/storage.dart';
import 'package:sma/respository/profile/repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  
  final _repository = ProfileRepository();
  final _databaseRepository = PortfolioStorageRepository();
  final hasConnection;

  ProfileBloc({
    @required this.hasConnection
  });

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    
    if (event is FetchProfileData) {

      yield ProfileLoading();

      if (this.hasConnection) {
        yield* _mapProfileState(symbol: event.symbol);
      } else {
        yield ProfileNoConnection();
      }
    }
  }

  Stream<ProfileState> _mapProfileState({String symbol}) async* {
    try {
      final bool isSymbolSaved = await this._databaseRepository.symbolExists(symbol: symbol);
      final ProfileModel profile = await this._repository.fetchStockData(symbol: symbol);

      yield ProfileLoaded( 
        profileModel: profile, 
        isSymbolSaved: isSymbolSaved
      );

    } catch (e, stack) {
      yield ProfileLoadingError(error: 'There was an unknown error.');
      await SentryHelper(exception: e,  stackTrace: stack).report();
    }
  }
}
