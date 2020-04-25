import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class BaseScreen extends StatelessWidget {

  final List<Widget> children;
  final Future<void> Function() onRefresh;

  BaseScreen({
    @required this.children,
    @required this.onRefresh
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: RefreshIndicator(
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            children: this.children
          )
        ), 
        onRefresh: onRefresh
      )
    );
  }
}