import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:sma/models/stock_profile.dart';
import 'package:sma/respository/stocks/repository.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {

  final _repository = StocksRepository();


  @override
  StocksState get initialState => StocksInitial();

  @override
  Stream<StocksState> mapEventToState( StocksEvent event ) async* {
    
    if (event is FetchStocks) {
      
      yield StocksLoading();

      final List<StockProfile> stocks = await Future.wait(event.symbols.map((symbol) async {
        return await this._repository.fetchProfile(symbol: symbol);
      }));

      yield StocksLoaded(stocks: stocks);
    }
  }
}
