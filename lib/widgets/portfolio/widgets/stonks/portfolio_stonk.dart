import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/helpers/color_helper.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/styles.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/profile/profile.dart';

class PortfolioStonkWidget extends StatelessWidget {

  final StockOverviewModel stockOverviewModel;

  PortfolioStonkWidget({
    @required this.stockOverviewModel
  });

  static const _companyNameStyle = const TextStyle(
    color: Color(0XFFc2c2c2),
    fontSize: 13
  );

  static const _stockPriceStyle = const TextStyle(
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(
        color: kTileColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildCompanyData(),
            _buildPriceData()
          ]
        ),

        height: 90,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          // Trigger fetch event.
          BlocProvider
            .of<ProfileBloc>(context)
            .add(FetchProfileData(symbol: stockOverviewModel.symbol));

          // Send to Profile.
          Navigator
            .push(context, MaterialPageRoute(builder: (_) => Profile(symbol: stockOverviewModel.symbol)));
        },
      ),
    );
  }

  /// This method is in charge of rendering the stock company data.
  /// This is the left side in the card. 
  /// It renders the  [symbol] and the company [name] from [StockOverviewModel].
  Widget _buildCompanyData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(stockOverviewModel.symbol, style: kStockTickerSymbol),
        SizedBox(height: 8.0),
        Text(stockOverviewModel.name, style: _companyNameStyle)
      ], 
    );
  }
  
  /// This method is in charge of rendering the stock company data.
  /// This is the right side in the card. 
  /// It renders the [change] and the stock's [price] from [StockOverviewModel].
  Widget _buildPriceData() {

    final String text = stockOverviewModel.changesPercentage < 0 
      ? '${formatText(stockOverviewModel.change)}'
      : '+${formatText(stockOverviewModel.change)}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(formatText(stockOverviewModel.price), 
            textAlign: TextAlign.end, 
            style: _stockPriceStyle
          ),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: standatBorder,
            color: determineColorBasedOnChange(stockOverviewModel.change)
          ),

          width: 60,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(text, textAlign: TextAlign.end,),
        ),
      ],
    );
  }
}
