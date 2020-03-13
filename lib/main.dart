import 'package:flutter/material.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market App',
      theme: _darkTheme,

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
      backgroundColor: Color(0XFF1e1e1e),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        alignment: Alignment.center,
        child: SafeArea(child: Portfolio())
      ),
    );
  }
}
