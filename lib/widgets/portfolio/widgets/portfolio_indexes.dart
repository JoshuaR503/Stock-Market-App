import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/data_overview.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioIndexes extends StatelessWidget {

  List<Widget> _buildUpperSection({
    DataOverview index, 
    bool isMarketOpen
  }) {

    final icon = index.change < 0 ? FontAwesomeIcons.sortDown : FontAwesomeIcons.sortUp;
    final color = index.change < 0  ? kNegativeColor: kPositiveColor;

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

  Widget _buildCard({DataOverview index, bool isMarketOpen}) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kTileColor,
        child: Container(
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildUpperSection(
              index: index, 
              isMarketOpen: isMarketOpen
            ),
          ),

          width: 100,
          padding: EdgeInsets.symmetric(vertical: 18),
        ),
        
        onPressed: () {},
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
          return Container(
            height: 205,
            padding: EdgeInsets.symmetric(vertical: 18),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.indexes.length,
              itemBuilder: (BuildContext context, int index) => _buildCard(
                index: state.indexes[index], 
                isMarketOpen: state.isMarketOpen
              )
            ),
          );
        }

        if (state is IndexesLoadingError) {
          return Center(child: Text(state.error));
        }

        return Container();
      }
    );
  }
}