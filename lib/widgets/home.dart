import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/bloc/stocks_bloc.dart';

import 'package:sma/widgets/portfolio/portfolio.dart';

class StockMarketApp extends StatelessWidget {

  final ThemeData _darkTheme = ThemeData(brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market App',
      theme: _darkTheme,
      home: StockMarketAppHome(),
    );
  }
}

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1e1e1e),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: BlocBuilder<StocksBloc, StocksState>(
            builder: (BuildContext context, StocksState state) {
              if (state is StocksInitial) {
                final symbols = 'AAPL,MSFT,V,MA,FB,JNJ,CVX'.split(',');

                BlocProvider
                .of<StocksBloc>(context)
                .add(FetchStocks(symbols: symbols));
              }

              if (state is StocksLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is StocksLoaded) {
                return Portfolio(stocks: state.stocks);
              } 

              return Center(child: CircularProgressIndicator());    
            },
          ),

          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        )
      ),
    );
  }
}
