import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/helpers/network_helper.dart';

import 'package:sma/widgets/about/about.dart';
import 'package:sma/widgets/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final hasConnection = await NetworkHelper().isConnected;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc(hasConnection: hasConnection),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(hasConnection: hasConnection),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(hasConnection: hasConnection),
        ),
        BlocProvider<SectorPerformanceBloc>(
          create: (context) => SectorPerformanceBloc(hasConnection: hasConnection),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(hasConnection: hasConnection),
        ),
      ],
      child: MaterialApp(
        title: 'Stock Market App',
        theme: ThemeData(brightness: Brightness.dark),
        home: StockMarketAppHome(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/about': (context) => AboutSection()
        },
      )
    )
  );
}