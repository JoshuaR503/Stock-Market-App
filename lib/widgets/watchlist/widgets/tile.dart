


import 'package:flutter/material.dart';

class WatchlistTile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final ShapeBorder shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));    

    return MaterialButton(
      shape: shape,
      height: 100,
      color: Color(0XFF3d3d3d),
      onPressed: () {},

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('FB'),
              Text('Facebook, Inc.')
            ], 
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('\$170.24'),
              Text('−7.95')
            ], 
          ),
        ],
      )

    );
  }
}

