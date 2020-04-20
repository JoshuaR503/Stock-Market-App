import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class BaseList extends StatelessWidget {

  final List<Widget> children;

  BaseList({
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: this.children
        )
      )
    );
  }
}