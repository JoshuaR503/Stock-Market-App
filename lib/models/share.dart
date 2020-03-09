
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class StockData {

  final Color color;
  final String name;
  final String tickerSymbol;
  final String price;

  const StockData({
    @required this.color,
    @required this.name,
    @required this.tickerSymbol,
    @required this.price,
  });
}