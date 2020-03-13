
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class StockModel {

  final Color color;
  final String name;
  final String tickerSymbol;
  final String price;
  final String change;

  const StockModel({
    @required this.color,
    @required this.change,
    @required this.name,
    @required this.tickerSymbol,
    @required this.price,
  });
}