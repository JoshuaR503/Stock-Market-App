
import 'package:flutter/material.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/profile/overview/stock_ownership.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfileOverview extends StatelessWidget {

  final List<StockOwnership> ownership;

  ProfileOverview({
    @required this.ownership
  });

  static Text _renderText(dynamic text) {
    return text != null 
    ? Text(compactText(text))
    : Text('-');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 26, right: 26, top: 26),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Top Shareholders', style: kProfileCompanyName),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: ownership.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(ownership[index].name, style: subtitleStyle),
                trailing: _renderText(ownership[index].share)
              ),
            )
          ],
        ),
      ],
    ); 
  }
}