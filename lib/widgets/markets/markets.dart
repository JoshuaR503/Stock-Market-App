
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/models/markets/market_active/market_active_model.dart';

import 'package:sma/shared/colors.dart';
import 'package:sma/shared/styles.dart';

import 'package:sma/widgets/markets/market_movers/market_movers.dart';
import 'package:sma/widgets/markets/sector_performance/sector_performance.dart';

import 'package:sma/widgets/markets/widgets/markets_header.dart';
import 'package:sma/widgets/widgets/base_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class MarketsSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectorPerformanceBloc, SectorPerformanceState>(
      builder: (BuildContext context, SectorPerformanceState state) {

        if (state is SectorPerformanceInitial) {
          BlocProvider
          .of<SectorPerformanceBloc>(context)
          .add(FetchSectorPerformance());
        }

        if (state is SectorPerformanceLoaded) {
          return BaseScreen(children: [

            MarketsHeader(),

            // Section title.
            Text('Sector Performance', style: subtitleStyling),
            SectorPerformance(performanceData: state.sectorPerformance),
            Divider(height: 2),

            // Section title.
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text('Most Active', style: subtitleStyling),
            ),
            _buildMarketMovers(stonks: state.marketActive, color: Color(0xFF263497)),


            // Section title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Top Gainers', style: subtitleStyling),
            ),
            _buildMarketMovers(stonks: state.marketGainer, color: kPositiveColor),

            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text('Top Losers', style: subtitleStyling),
            ),
            _buildMarketMovers(stonks: state.marketLoser, color: Colors.red),
          ]);
        }
        
        return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: LoadingIndicatorWidget()
        );
      }
    );
  }

  Widget _buildMarketMovers({MarketMoversModelData stonks, Color color}) {
    return Container(
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: stonks.marketActiveModelData.length,
        itemBuilder: (BuildContext context, int index) => MarketMovers(
          data: stonks.marketActiveModelData[index],
          color: color,
        )
      ),
    );
  }
}