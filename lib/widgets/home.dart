import 'package:flutter/material.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';
import 'package:sma/widgets/widgets/base_screen.dart';

class StockMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market App',
      home: BaseScreen(child: Portfolio()),
      theme: ThemeData(brightness: Brightness.dark),

      debugShowCheckedModeBanner: false,
    );
  }
}