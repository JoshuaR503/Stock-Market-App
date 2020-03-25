
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/widgets/widgets/base_screen.dart';

class SearchScreen extends StatelessWidget {
  Widget _renderTop(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: FaIcon(FontAwesomeIcons.chevronLeft, size: 22,),
              onTap: () => Navigator.of(context).pop()
            ),

            SizedBox(width: 20),
            
            Text('Search', style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            )),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 18, right: 18, top: 26),
        children: <Widget>[
          this._renderTop(context)
        ],
      )
    );
  }
}