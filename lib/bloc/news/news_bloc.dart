import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/network_helper.dart';
import 'package:sma/helpers/sentry_helper.dart';

import 'package:sma/models/news/news.dart';

import 'package:sma/respository/news/repository.dart';
import 'package:sma/respository/portfolio/storage/storage_client.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final  _newsRepository = NewsRepository(); 
  final  _databaseRepository = PortfolioStorageClient();

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState( NewsEvent event ) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      yield* _connectionMiddleMan();
    }
  }

  Stream<NewsState> _connectionMiddleMan() async* {
    final hasConnection = await NetworkHelper().isConnected;

    if (hasConnection) {
      yield* _fetchNews();
    } else {
      yield NewsError(message: 'No Internet Connection');
    }
  }

  Stream<NewsState> _fetchNews() async* {
    try {
      
      final symbols = await this._databaseRepository.fetch();

      if (symbols.isEmpty) {
        yield NewsError(message: 'Your watchlist is empty');
      } else {
        
        final news =  await Future
        .wait(symbols
        .map((symbol) async => await _newsRepository.fetchNews(title: symbol.companyName)));

        yield NewsLoaded(news: news);  
      }

    } catch (e, stack) {
      yield NewsError(message: 'There was an error loading');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
