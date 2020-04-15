
import 'package:sma/models/news/news.dart';
import 'package:sma/respository/news/news_client.dart';

class NewsRepository extends NewsClient {
  
  Future<NewsDataModel> fetchNews({String symbol}) async {
    return await super.fetchNews(symbol: symbol);
  }

}