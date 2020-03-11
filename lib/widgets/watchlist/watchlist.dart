


import 'package:flutter/material.dart';
import 'package:sma/widgets/watchlist/widgets/tile.dart';

class Watchlist extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        WatchlistTile(),
        WatchlistTile(),

      ],

    );
  }
}

