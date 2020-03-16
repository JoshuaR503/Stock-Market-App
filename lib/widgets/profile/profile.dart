import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/profile.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class Profile extends StatefulWidget { 

  final String symbol;

  Profile({
    @required this.symbol
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
            Text(name, style: kProfileCompanyName, overflow: TextOverflow.ellipsis,),
            FaIcon(FontAwesomeIcons.solidCheckCircle, color: kPositiveColor,)
          ], 
        ),

        SizedBox(height: 8),

        Text('\$$price',style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        )) 
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

            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ProfileLoaded) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 26, right: 26, top: 46),
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

            return Center(child: CircularProgressIndicator());
          },
        )
      )
    );
  }
}