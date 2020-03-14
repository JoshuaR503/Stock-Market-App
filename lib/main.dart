import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/widgets/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc(),
        ),
      ],
      child: StockMarketApp(),
    )
  );
}