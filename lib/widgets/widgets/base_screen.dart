


import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class BaseScreen extends StatelessWidget {

  final Widget child;

  BaseScreen({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: child
        )
      ),
    );
  }
}