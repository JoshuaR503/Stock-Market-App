
import 'package:sma/models/profile/quote.dart';
import 'package:sma/respository/profile/client.dart';

class ProfileRepository {

  Future<StockQuote> fetchProfile({String symbol}) async {
    return await ProfileClient.fetchProfile(symbol: symbol);
  }
  
}