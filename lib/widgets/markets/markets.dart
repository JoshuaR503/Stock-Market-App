
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/models/markets/market_active/market_active_model.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/markets/market_movers/market_movers.dart';

import 'package:sma/widgets/markets/sector_performance/sector_performance.dart';
import 'package:sma/widgets/markets/widgets/markets_header.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class Markets extends StatelessWidget {


  Widget _buildMarketMovers({MarketMoversModelData stonks, Color color}) {
    return Container(
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        physics: BouncingScrollPhysics(),

        scrollDirection: Axis.horizontal,
        itemCount: stonks.marketActiveModelData.length,
        itemBuilder: (BuildContext context, int index) => MarketMovers(
          data: stonks.marketActiveModelData[index],
          color: color,
        )
      ),
    );
  }

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
          return Scaffold(
            // backgroundColor: Color(0XFF101518),
            backgroundColor: kScaffoldBackground,
            body: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 18, right: 18, top: 18),
                children: <Widget>[
                  MarketsHeader(),
                  SectorPerformance(performanceData: state.sectorPerformance),
                  Divider(height: 2),

                  SizedBox(height: 16),
                  Text('Most Active', style: TextStyle(
                    color: kGray,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  )),
                  SizedBox(height: 8),
                  _buildMarketMovers(stonks: state.marketActive, color: Color(0xFF263497)),

                  SizedBox(height: 8),
                  Text('Top Gainers', style: TextStyle(
                    color: kGray,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  )),
                  SizedBox(height: 8),
                  _buildMarketMovers(stonks: state.marketGainer, color: kPositiveColor),

                  SizedBox(height: 8),
                  Text('Top Losers', style: TextStyle(
                    color: kGray,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  )),
                  SizedBox(height: 8),
                  _buildMarketMovers(stonks: state.marketLoser, color: Colors.red),
                  SizedBox(height: 16),


                ]
              )
            ),
          );
        }
        
        return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: LoadingIndicatorWidget()
        );

      }
    );
  }
}