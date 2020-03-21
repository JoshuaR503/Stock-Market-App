import 'package:dio/dio.dart';

import 'package:sma/keys.dart';
import 'package:sma/models/search/search.dart';

class SearchClient {

  static Future<List<StockSearch>> searchStock({String symbol}) async {

    final Uri uri = Uri.https('www.alphavantage.co', '/query', {
      'function': 'SYMBOL_SEARCH',
      'keywords': symbol,
      'apikey': alphavantageKey
    });


    final response = await Dio().getUri(uri);
    final data = response.data['bestMatches'];

    return StockSearch.convertToList(data);
  }

}