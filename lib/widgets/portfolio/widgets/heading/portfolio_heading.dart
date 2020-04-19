import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/shared/styles.dart';

import 'package:sma/widgets/portfolio/widgets/styles.dart';

class PortfolioHeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String formatted = DateFormat('MMMMd').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Portfolio', style: kPortfolioScreenTitle),
            GestureDetector(
              child: FaIcon(FontAwesomeIcons.redoAlt, size: 22,),
              onTap: () {
                BlocProvider
                .of<PortfolioBloc>(context)
                .add(FetchPortfolioData());
              }
            )
          ],
        ),
        
        Text(formatted, style: kSubtitleStyling),
      ],
    );
  }
}