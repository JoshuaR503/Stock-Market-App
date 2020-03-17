import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/widgets/spinner.dart';
import 'package:sma/widgets/profile/widgets/graph.dart';

import 'package:sma/widgets/profile/widgets/profile.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class Profile extends StatefulWidget { 

  final String symbol;
  final Color color;

  Profile({
    @required this.symbol,
    @required this.color
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Widget _renderTop({String name, double price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Text('\$${price.toStringAsFixed(2)}',style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )),

            FaIcon(FontAwesomeIcons.solidCheckCircle, color: this.widget.color)
          ], 
        ),

        SizedBox(height: 8),

        Text(name, style: kProfileCompanyName),
      ],
    );
  }

  Widget _renderGraph() {
    return Container(

      height: 250,
      child: SimpleTimeSeriesChart()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(this.widget.symbol),
        backgroundColor: this.widget.color,
      ),
      
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {

            if (state is ProfileLoaded) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 26, right: 26, top: 26),
                children: <Widget>[

                  this._renderTop(
                    name: state.quote.name, 
                    price: state.quote.price
                  ),

                  this._renderGraph(),

                  StatisticsWidget(quote: state.quote),
                  CompanyProfileWidget(profile: state.profile),
                ],
              );
            }

            return SpinnerWidget(color: this.widget.color);
          },
        )
      )
    );
  }
}