

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/markets/markets_performance.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class MarketsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: RefreshIndicator(
        
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [

              StandardHeader(
                title: 'U.S Markets',
                subtitle: 'Sector Performance',
                action: Container(),
              ),

              MarketsPerformance()
            ]
          )
        ),

        onRefresh: () async {
          // Reload markets section.
          BlocProvider
            .of<SectorPerformanceBloc>(context)
            .add(FetchSectorPerformance());
        },
      )
    );
  }
}

