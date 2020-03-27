
import 'package:meta/meta.dart';
import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/models/profile/stock_quote.dart';

class ProfileModel {

  final StockProfile stockProfile;
  final StockQuote stockQuote;

  ProfileModel({
    @required this.stockProfile,
    @required this.stockQuote
  });

  factory ProfileModel.fromJson(Map<String, dynamic> stockProfile, Map<String, dynamic> stockQuote) {
    return ProfileModel(
      stockProfile: StockProfile.fromJson(stockProfile),
      stockQuote: StockQuote.fromJson(stockQuote)
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['stockProfile'] = this.stockProfile;
    data['stockQuote'] = this.stockQuote;
    return data;
  }
}