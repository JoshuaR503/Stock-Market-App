import 'package:meta/meta.dart';
import 'package:sma/models/profile/news/stock_news.dart';

import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';
import 'package:sma/models/profile/stock_chart.dart';

class ProfileModel {

  final StockProfile stockProfile;
  final StockQuote stockQuote;
  final List<StockChart> stockChart;
  final List<StockNews> stockNews;

  ProfileModel({
    @required this.stockProfile,
    @required this.stockQuote,
    @required this.stockChart,
    @required this.stockNews,
  });
}
