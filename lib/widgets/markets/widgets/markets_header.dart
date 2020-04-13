
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sma/widgets/portfolio/widgets/styles.dart';

class MarketsHeader extends StatelessWidget {

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
            Text('U.S Markets', style: kPortfolioScreenTitle),
            // GestureDetector(
            //   child: FaIcon(FontAwesomeIcons.redoAlt, size: 22,),
            //   onTap: () {},
            // )
          ],
        ),
        // Text('As of $formatted', style: kPortfolioScreenDate),
      ],
    );
  }
}