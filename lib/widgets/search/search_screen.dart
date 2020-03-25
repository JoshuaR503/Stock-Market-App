
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/widgets/widgets/base_screen.dart';

class SearchScreen extends StatelessWidget {
    Widget _buildTextFormField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 15.5),
        border: InputBorder.none,
      ),

      onFieldSubmitted: (value) {

      }
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
      Icon(Icons.search),
      SizedBox(width: 13),
      Expanded(child: _buildTextFormField(context)),
    ];
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildChildren(context),
    );
  }

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
          this._renderTop(context),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 18),

            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),

            child: _buildRow(context),
          )
        ],
      )
    );
  }
}