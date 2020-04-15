part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsErrorLoading extends NewsState {}

class NewsLoaded extends NewsState {

  final List<NewsDataModel> news;

  NewsLoaded({
    @required this.news
  });

}
