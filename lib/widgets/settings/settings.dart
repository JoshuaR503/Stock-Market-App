

import 'package:flutter/material.dart';
import 'package:sma/shared/colors.dart';

class SettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Information'),
          backgroundColor: Colors.indigo,
          bottom: TabBar(
            indicatorColor: Color(0X881f1f1f),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'What is this',),
              Tab(text: 'Financial Data'),
            ],
          )
        ),
        
        backgroundColor: kScaffoldBackground,
        body: SafeArea(
          child: TabBarView(
            children: [
              Center(),
              Center(),
            ]
          ),
        )
      ),
    );
  }
}