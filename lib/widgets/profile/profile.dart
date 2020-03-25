import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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

  Widget _renderTop({String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(name, style: kProfileCompanyName),
          flex: 10,
        ),

        Expanded(child: Container()),
        
        Expanded(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.solidCheckCircle, color: this.widget.color,), 
            onPressed: () {}
          ),

          flex: 1,
        )
      ],
    );
  }

  Widget _renderChange({double price}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${NumberFormat().format(price)}', style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }

  Widget _renderGraph() {
    return Container(
      height: 250,
      child: SimpleTimeSeriesChart(color: widget.color)
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
                
                  this._renderTop(name: state.quote.name),
                  this._renderChange(price: state.quote.price),
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