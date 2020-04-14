import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:sma/helpers/sentry_helper.dart';

import 'package:sma/models/data_overview.dart';
import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/respository/portfolio/storage/storage.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  
  final _databaseRepository = PortfolioStorageRepository();
  final _repository = PortfolioRepository();

  @override
  PortfolioState get initialState => PortfolioInitial();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is FetchPortfolioData) {
    yield PortfolioLoading();
      yield PortfolioLoading();
      yield* _fetchSymbols();
    }

    if (event is SaveProfile) {
      yield PortfolioLoading();
      await this._databaseRepository.save(symbol: event.symbol);
      yield* _fetchSymbols();
    }

    if (event is DeleteProfile) {
      yield PortfolioLoading();
      await this._databaseRepository.delete(symbol: event.symbol);
      yield* _fetchSymbols();
    } 
  }

  Stream<PortfolioState> _fetchSymbols() async* {
    try {
      final symbolsStored = await _databaseRepository.fetch();
      
      if (symbolsStored.isNotEmpty) {
        yield PortfolioLoaded(stocks: await _fetchFromNetwork(symbols: symbolsStored));
      } else {
        yield PortfolioEmpty();
      }

    } catch (e, stack) {
      await SentryHelper(exception: e, stackTrace: stack).report();
      yield PortfolioLoadingError(error: e);
    }
  }

  Future<List<StockOverviewModel>> _fetchFromNetwork({List<String> symbols}) async {
    return await Future
    .wait(symbols
    .map((symbol) async => await _repository.fetchData(symbol: symbol)));
  }

}
