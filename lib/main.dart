import 'package:flutter/material.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market App',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Color(0XFF272628),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        alignment: Alignment.center,
        child: SafeArea(child: Portfolio())
      ),
    );
  }
}

