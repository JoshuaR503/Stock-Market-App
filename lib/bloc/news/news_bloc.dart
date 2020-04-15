import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry_helper.dart';

import 'package:sma/models/news/news.dart';

import 'package:sma/respository/news/repository.dart';
import 'package:sma/respository/portfolio/storage/storage.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository _newsRepository = NewsRepository(); 
  final PortfolioStorageRepository _databaseRepository = PortfolioStorageRepository();

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState( NewsEvent event ) async* {
  
    if (event is FetchNews) {
      yield NewsLoading();
      yield* _fetchNews();
    }
  }

  Stream<NewsState> _fetchNews() async* {
    try {
      final symbolsStored = await _databaseRepository.fetch();
      
      if (symbolsStored.isNotEmpty) {
        final news =  await Future
        .wait(symbolsStored
        .map((symbol) async => await _newsRepository.fetchNews(symbol: symbol)));

        yield NewsLoaded(news: news);
        
      } else {
        yield NewsEmpty();
      }

    } catch (e, stack) {
      await SentryHelper(exception: e, stackTrace: stack).report();
      yield NewsErrorLoading();
    }
  }
}
