import 'package:flutter/material.dart';
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
          child: Portfolio()
        )
      ),
    );
  }
}
