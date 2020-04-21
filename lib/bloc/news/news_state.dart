part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsEmpty extends NewsState {
  final String message;

  NewsEmpty({
    @required this.message
  });
}

class NewsLoading extends NewsState {}

class NewsErrorLoading extends NewsState {
  final String message;

  NewsErrorLoading({
    @required this.message
  });
}

class NewsLoaded extends NewsState {

  final List<NewsDataModel> news;

  NewsLoaded({
    @required this.news
  });

}
