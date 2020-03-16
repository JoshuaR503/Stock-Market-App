import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0
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
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {

            if (state is ProfileInitial) {
              BlocProvider
              .of<ProfileBloc>(context)
              .add(FetchProfileData(symbol: symbol));
            }

            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ProfileLoaded) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 18, right: 18, top: 46),
                children: <Widget>[
                  this._renderTop(),
                  this._renderGraph(),
                  SizedBox(height: 100),
                  StatisticsWidget(quote: state.profile)
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        )
      )
    );
  }
}