import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/about/attributions/attributions.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.indigo,
      ),

      backgroundColor: kScaffoldBackground,
      body: SafeArea(child: Attributions())
    );
  }
}