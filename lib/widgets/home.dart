import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/markets/markets_section.dart';
import 'package:sma/widgets/news/news_section.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';
import 'package:sma/widgets/search/search_section.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  int _selectedIndex = 0;

  final List<Widget> tabs = [
    PortfolioSection(),
    MarketsSection(),
    SearchSection(),
    NewsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.white30,
            selectedIndex: _selectedIndex,
            tabs: _bottomNavigationBarItemItems(),
            onTabChange: _onItemTapped
          ),
        ),
      )
    );
  }

  List<GButton> _bottomNavigationBarItemItems() {
    return [
      GButton(
        icon: FontAwesomeIcons.shapes,
        text: 'Home',
      ),
      GButton(
        icon: FontAwesomeIcons.suitcase,
        text: 'Markets',
      ),
      GButton(
        icon: FontAwesomeIcons.search,
        text: 'Search',
      ),
      GButton(
        icon: FontAwesomeIcons.globeAmericas,
        text: 'News',
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}