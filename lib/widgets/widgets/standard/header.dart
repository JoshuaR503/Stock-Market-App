import 'package:flutter/material.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';

class StandardHeader extends StatelessWidget {

  final String title;
  final Widget action;

  StandardHeader({
    @required this.title,
    @required this.action
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.title, style: kPortfolioScreenTitle),
            this.action
          ],
        ),
      ],
    );
  }
}