import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sma/helpers/sentry_helper.dart';

import 'package:sma/models/news/news.dart';

import 'package:sma/respository/news/repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository _newsRepository = NewsRepository(); 

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
      
      final titles = ['Dow Jones', 'S&P 500', 'Technology', 'Finance'];

      final news =  await Future
      .wait(titles
      .map((symbol) async => await _newsRepository.fetchNews(title: symbol)));

      yield NewsLoaded(news: news);

    } catch (e, stack) {
      await SentryHelper(exception: e, stackTrace: stack).report();
      yield NewsErrorLoading();
    }
  }
}
