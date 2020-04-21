// TODO: You will need to get your own API keys in order to run this project.
// TODO: Remove the 'package:sma/key.dart' package and replace the varibales' value with your own API keys.
import 'package:sma/key.dart';

/// Sentry DNS is used to track errors. It is beeing used at [SentryHelper].
/// To get your DNS, go to https://sentry.io/. 
/// Create a project and follow these steps: https://forum.sentry.io/t/where-can-i-find-my-dsn/4877
const String kSentryDomainNameSystem = sentryDNS;

/// The Alpha Vantage API is used to power the Search Section.
/// It is used at [SearchClient]. 
/// To get your own API key go to https://www.alphavantage.co.
const String kAlphaVantageKey = alphavantageKey;

/// The Finnhub Stock API is used to power the news section in the [ProfileSection] page.
/// It is used at [ProfileClient]. 
/// To get your own API key go to https://finnhub.io.
const String kFinnhubKey = finnhubKey;

/// The News API is used to power the news section.
/// It is used at [NewsClient]. 
/// To get your own API key go to https://newsapi.org.
const String kNewsKey = newsApi;

