

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';

class Profile extends StatelessWidget { 

  final String symbol;

  Profile({
    @required this.symbol
  });

  Widget _renderTop() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Apple Inc.',style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
            )),

            FaIcon(FontAwesomeIcons.solidCheckCircle, color: kPositiveColor,)
          ], 
        ),

        SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('\$274.50',style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600
            )),
          ], 
        )
      ],
    );
  }

  Widget _renderGraph() {
    return Container();
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 18, right: 18, top: 46),
          children: <Widget>[
            this._renderTop(),
            this._renderGraph(),
            SizedBox(height: 200),
            StatisticsWidget()
          ],
        ), 
      )
    );
  }
}