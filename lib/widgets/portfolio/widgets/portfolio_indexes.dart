import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/helpers/text_helper.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioIndexes extends StatelessWidget {

  List<Widget> _buildUpperSection(MarketIndex index) {

    final icon = index.change < 0 
      ? FontAwesomeIcons.sortDown
      : FontAwesomeIcons.sortUp;

    final color = index.change < 0 
      ? kNegativeColor
      : kPositiveColor;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(index.symbol, style: kTickerStyle),
              FaIcon(icon, color: color)
            ]
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(index.name, style: kCompanyName, maxLines: 1),
          ),
        ],
      ),

      Text(formatText(index.price), style: kStockTickerSymbol)  
    ];
  }

  Widget _renderContent(MarketIndex index) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kTileColor,
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildUpperSection(index),
          ),

          width: 100,
          padding: EdgeInsets.symmetric(vertical: 18),
        ),

        onPressed: () {},
      ),
    );
  }

  Widget _build(IndexesLoaded state) {
    return Container(
      height: 205,
      padding: EdgeInsets.symmetric(vertical: 18),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: state.indexes.length,
        itemBuilder: (BuildContext context, int index) => this._renderContent(state.indexes[index]),
      ),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesBloc, IndexesState>(
      builder: (BuildContext context, IndexesState state) {

        if (state is IndexesInitial) {
          BlocProvider
          .of<IndexesBloc>(context)
          .add(FetchIndexes());
        }

        if (state is IndexesLoaded) {
          return _build(state); 
        }

        if (state is IndexesLoadingError) {
          return Center(child: Text(state.error));
        }

        return LoadingIndicatorWidget();
      }
    );
  }
}