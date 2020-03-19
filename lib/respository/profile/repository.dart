import 'package:sma/models/profile/profile.dart';
import 'package:sma/models/profile/quote.dart';
import 'package:sma/models/profile/rating.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<StockQuote> fetchQuote({String symbol}) async {
    try {
      return await ProfileClient.fetchQuote(symbol: symbol);
    } catch (e) {
      return null;
    }
  }
  
  Future<CompanyProfile> fetchProfile({String symbol}) async {
    try {
      return await ProfileClient.fetchProfile(symbol: symbol);
    } catch (e) {
      return null;
    }
  }

  Future<StockRating> fetchRating({String symbol}) async {
    try {
      return await ProfileClient.fetchRating(symbol: symbol);
    } catch (e) {
      return null;
    }
  }

}