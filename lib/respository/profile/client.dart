import 'package:dio/dio.dart';

import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/key.dart';
import 'package:sma/models/profile/news/stock_news.dart';
import 'package:sma/models/profile/overview/stock_ownership.dart';

import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/stock_chart.dart';

import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';

class ProfileClient {

  Future<StockQuote> fetchProfileChanges({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);

    return StockQuote.fromJson(response.data[0]);
  }
  
  Future<ProfileModel> fetchStockData({String symbol}) async {
    final Uri quoteUri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Uri profileUri = Uri.https(authority, '/api/v3/company/profile/$symbol');
    final Uri chartUri = Uri.https(authority, '/api/v3/historical-price-full/$symbol', {
      'from': '2019-04-01',
      'to': '2020-04-02'
    });

    final Uri stockNewsUri = Uri.https('finnhub.io', '/api/v1/news/$symbol', {
      'token': finnhubKey
    });

    final Uri stockOwnershipUri = Uri.https('finnhub.io', '/api/v1/stock/investor-ownership', {
      'symbol': symbol,
      'limit': '10',
      'token': finnhubKey
    });

    return ProfileModel(
      stockQuote: await _fetchQuote(uri: quoteUri),
      stockProfile: await _fetchProfile(uri: profileUri),
      stockChart: await _fetchChart(uri: chartUri),
      stockNews: await _fetchStockNews(uri: stockNewsUri),
      stockOwnership: await _fetchStockOwnership(uri: stockOwnershipUri)
    );
  }

  static Future<List<StockOwnership>> _fetchStockOwnership({Uri uri}) async {
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return StockOwnership.toList(response.data['ownership']);
  }

  static Future<List<StockNews>> _fetchStockNews({Uri uri}) async {
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return StockNews.toList(response.data);
  }

  static Future<StockQuote> _fetchQuote({Uri uri}) async {
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return StockQuote.fromJson(response.data[0]);
  }

  static Future<StockProfile> _fetchProfile({Uri uri}) async {
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return StockProfile.fromJson(response.data['profile']);
  }

  static Future<List<StockChart>> _fetchChart({Uri uri}) async {
    final response = await FetchClient().fetchData(uri: uri);
    return StockChart.toList(response.data['historical']);
  }

}
