import 'package:flutter/material.dart';
import 'package:sma/models/stock_model.dart';

final List<StockModel> stocks = [
  StockModel(
    color: Color(0XFF3d3d3d),
    change: '−9.91',
    name: 'Apple Inc.',
    tickerSymbol: 'AAPL',
    price: '288.95'
  ),
  StockModel(
    color: Color(0XFF3d3d3d),
    change: '-10.81',
    name: 'Mastercard Incorporated',
    tickerSymbol: 'MA',
    price: '287.01'
  ),
  StockModel(      
    color: Color(0XFF3d3d3d),
    change: '-9.65',
    name: 'Visa Inc.',
    tickerSymbol: 'V',
    price: '184.36'
  ),
  StockModel(
    color: Color(0XFF3d3d3d),
    change: '−7.29',
    name: 'Microsoft Corporation.',
    tickerSymbol: 'MSFT',
    price: '153.63'
  ),
  StockModel(
    color: Color(0XFF3d3d3d),
    change: '−9.84',
    name: 'Johnson & Johnson',
    tickerSymbol: 'JNJ',
    price: '131.80'
  ),
];