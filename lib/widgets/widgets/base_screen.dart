import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class BaseScreen extends StatelessWidget {

  final List<Widget> children;

  BaseScreen({
    @required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          children: this.children
        )
      ),
    );
  }
}