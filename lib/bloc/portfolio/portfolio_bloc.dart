import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry.dart';
import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_overview.dart';
import 'package:sma/respository/portfolio/repository.dart';
import 'package:sma/respository/storage/storage.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  
  final _repository = PortfolioRepository();
  final _databaseRepository = DatabaseRepository();
  
  @override
  PortfolioState get initialState => PortfolioInitial();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is FetchPortfoliData) {
      
      yield PortfolioLoading();

      try {

        final symbolsStored = await _databaseRepository.fetch();

        if (symbolsStored.length == 0) {
          yield PortfolioEmpty();
        }

        // final List<StockOverview> stocks = await Future
        // .wait(event.stockSymbols
        // .map((symbol) async => await this._repository.fetchProfile(symbol: symbol)));

        // final List<MarketIndex> indexes = await Future
        // .wait(event.marketSymbols
        // .map((symbol) async => await this._repository.fetchMarketIndex(symbol: symbol)));

        // yield PortfolioLoaded(
        //   stocks: stocks,
        //   indexes: indexes
        // );

      } catch (e, stack) {
        
        await SentryHelper(
          exception: e, 
          stackTrace: stack
        ).report();
        
        yield PortfolioLoadingError(error: e.toString());
      }
    }
  }
}
