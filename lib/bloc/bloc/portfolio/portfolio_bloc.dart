import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_profile.dart';
import 'package:sma/respository/portfolio/repository.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  
  final _repository = PortfolioRepository();

  @override
  PortfolioState get initialState => PortfolioInitial();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is FetchPortfoliData) {
      
      yield PortfolioLoading();

      final List<StockProfile> stocks = await Future.wait(event.stockSymbols.map((symbol) async {
        return await this._repository.fetchProfile(symbol: symbol);
      }));

      final List<MarketIndex> indexes = await Future.wait(event.marketSymbols.map((symbol) async {
        return await this._repository.fetchMarketIndex(symbol: symbol);
      }));

      yield PortfolioLoaded(
        stocks: stocks,
        indexes: indexes
      );
    }
  }
}
