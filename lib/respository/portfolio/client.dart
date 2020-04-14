import 'package:dio/dio.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/models/profile/market_index.dart';

class PortfolioClient {

  Future<List<MarketIndexModel>> fetchIndexes() async {
    final Uri uri = Uri.https(authority, '/api/v3/majors-indexes');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return MarketIndexModel.toList(response.data['majorIndexesList']);
  }

  Future<DataOverview> fetchData({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return DataOverview.fromJson(response.data[0]);
  }
}