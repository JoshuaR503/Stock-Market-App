
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class MarketsHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('U.S Markets', style: kPortfolioScreenTitle),
            GestureDetector(
              child: FaIcon(FontAwesomeIcons.redoAlt, size: 22,),
              onTap: () {
                // Reload current page to fecth new data.
                BlocProvider
                .of<SectorPerformanceBloc>(context)
                .add(FetchSectorPerformance());
              },
            )
          ],
        ),
      ],
    );
  }
}