import 'package:dio/dio.dart';

import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/key.dart';
import 'package:sma/models/news/news.dart';
import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/models/news/symbol_overview_model.dart';

class NewsClient extends FetchClient {

  Future<NewsDataModel> fetchNews({String symbol}) async {

    final Uri symbolUri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Uri newsUri = Uri.https('newsapi.org', '/v2/everything', {
      'q': '"$symbol"',
      'sortBy': 'popularity',
      'pageSize': '10',
      'apikey': newsApi
    });

    final Response<dynamic> symbolResponse = await super.fetchData(uri: symbolUri);
    final Response<dynamic> newsResponse = await super.fetchData(uri: newsUri);
    
    final SymbolOverviewModel symbolOverviewModel = SymbolOverviewModel.fromJson(symbolResponse.data[0]);
    final List<SingleNewModel> newsOverviews = SingleNewModel.toList(newsResponse.data['articles']);

    return NewsDataModel(
      news: newsOverviews,
      symbolOverviewModel: symbolOverviewModel
    );
  }

}