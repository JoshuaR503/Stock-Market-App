import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/widgets/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<IndexesBloc>(
          create: (context) => IndexesBloc(),
        ),
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
      ],
      child: StockMarketApp(),
    )
  );
}