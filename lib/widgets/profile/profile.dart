

import 'package:flutter/material.dart';

class Profile extends StatelessWidget { 

  final String symbol;

  Profile({
    @required this.symbol
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(


      child: Text(
        
        this.symbol,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),

      ),
      

    );
  }
}