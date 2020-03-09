import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/shared/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      appBar: AppBar(
        title: Text('Stock Market'),
        centerTitle: true,
      ),

      body: Container(
        color: Color(0XFF272628),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        alignment: Alignment.center,

        child: Column(
          children: <Widget>[
            Overview(),
            
          ],
        ),
      ),
    );
  }
}


class Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Portfolio', style: kTitleStyle,),
            Text('View List', style: kSubtitleStyle),
          ],
        ),

        SizedBox(height: 30),

        OverviewSymbols(),
      ],
    );
  }
}


class OverviewSymbols extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[

        OverviewCard(),
        OverviewCard(),
        OverviewCard(),
        OverviewCard(),
        OverviewCard(),
        OverviewCard(),
        OverviewCard(),
        OverviewCard(),

      ],
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ShapeBorder shape = RoundedRectangleBorder( borderRadius: BorderRadius.circular(15));    

    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: MaterialButton(
        color: Color(0XFF5B62A7),
        child: _buildCard(),
        shape: shape,
        onPressed: () {},
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MSFT', style: kTickerStyle),
                  FaIcon(FontAwesomeIcons.sortUp)
                ],  
              ),

              SizedBox(height: 8,),
              Text('Microsoft Corporation', style: kNameStyle),
            ],
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('\$161.57', style: kNameStyle),
              ], 
            ),
          )
        ],
      ),
    );
  }
}
