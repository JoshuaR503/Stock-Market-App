import 'package:dio/dio.dart';

import 'package:sma/helpers/http_helper.dart';
import 'package:sma/key.dart';
import 'package:sma/models/news/news.dart';
import 'package:sma/models/news/single_new_model.dart';

class NewsClient extends FetchClient {

  Future<NewsDataModel> fetchNews({String title}) async {

    final Uri newsUri = Uri.https('newsapi.org', '/v2/everything', {
      'q': '"$title"',
      'language': 'en',
      'sortBy': 'popularity',
      'pageSize': '10',
      'apikey': newsApi
    });

    final Uri companyLogo = Uri.https('autocomplete.clearbit.com', '/v1/companies/suggest', {
      'query': title.split(" ")[0],
    });

    final Response<dynamic> newsResponse = await super.fetchData(uri: newsUri);
    final Response<dynamic> companyLogoResponse = await super.fetchData(uri: companyLogo);

    final List<SingleNewModel> newsOverviews = SingleNewModel.toList(newsResponse.data['articles']);

    return NewsDataModel(
      companyLogo: companyLogoResponse.data[0]['logo'],
      keyWord: title,
      news: newsOverviews,
    );
  }
}