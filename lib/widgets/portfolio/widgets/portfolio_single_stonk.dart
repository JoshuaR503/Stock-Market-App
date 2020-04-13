import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';

class PortfolioSingleStonk extends StatelessWidget {

  final DataOverview dataOverview;

  PortfolioSingleStonk({
    @required this.dataOverview
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      
      child: MaterialButton(
        color: kTileColor,
        child: _buildContent(),

        height: 90,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        onPressed: () {
          // Trigger fetch event.
          BlocProvider
            .of<ProfileBloc>(context)
            .add(FetchProfileData(symbol: dataOverview.symbol));

          // Send to Profile.
          Navigator
            .push(context, MaterialPageRoute(builder: (_) => Profile(symbol: dataOverview.symbol)));
        },
      ),
    );
  }

  /// This method is in charge of rendering the button's content.
  /// It creates a row that displays the stonk's price and company data.
  Widget _buildContent() {

    final String text = dataOverview.changesPercentage < 0 
      ? '${formatText(dataOverview.change)}'
      : '+${formatText(dataOverview.change)}';

    final TextStyle style = dataOverview.changesPercentage < 0 
      ? kNegativeChange
      : kPositiveChange;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(dataOverview.symbol, style: kStockTickerSymbol),
            SizedBox(height: 8.0),
            Text(dataOverview.name, style: kCompanyName)
          ], 
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('\$${formatText(dataOverview.price)}'),
            SizedBox(height: 8.0),
            Text(text, style: style)
          ],
        )
      ]
    );
  }
}