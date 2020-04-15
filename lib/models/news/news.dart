import 'package:meta/meta.dart';
import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/models/news/symbol_overview_model.dart';

class NewsDataModel {

  final SymbolOverviewModel symbolOverviewModel;
  final List<SingleNewModel> news;

  NewsDataModel({
    @required this.symbolOverviewModel,
    @required this.news
  });
   
}