import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'package:sma/shared/styles.dart';
import 'package:sma/widgets/about/about.dart';
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
              child: Icon(LineAwesomeIcons.question_circle, size: 34),
              onTap: () { 
                Navigator
                .push(context, MaterialPageRoute(builder: (_) => AboutSection()));
              },
            )
          ],
        ),
        
        Text(formatted, style: kSubtitleStyling),
      ],
    );
  }
}