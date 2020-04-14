import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/markets/markets.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';

class StockMarketAppHome extends StatefulWidget {
  
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  int _selectedIndex = 0;
  
  final widgets = [
    Portfolio(),
    Markets(),
    Center(
      child: Text(
        'Stock Market news coming soon.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Search Screen coming soon.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Settings Screen coming soon.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: widgets[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar()
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _bottomNavigationBar() {
    return SnakeNavigationBar(
      elevation: 1.0,
      backgroundColor: Color(0XFF181818),

      showSelectedLabels: false,
      showUnselectedLabels: false,
      snakeColor: Colors.white,
      selectedItemColor: Colors.white,
      snakeShape:  SnakeShape.indicator,
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), 
          topRight: Radius.circular(8)
        ),
      ),
      
      items: _bottomNavigationBarItemItems(),
      currentIndex: _selectedIndex,
      onPositionChanged: _onItemTapped,
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItemItems() {
    return [
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.suitcase),
        title: Text('Stonks', style:  TextStyle(fontSize: 14),),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.globeAmericas),
        title: Text('Markets', style:  TextStyle(fontSize: 14),),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.solidNewspaper),
        title: Text('News', style:  TextStyle(fontSize: 14),),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.search),
        title: Text('Search', style:  TextStyle(fontSize: 14),),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.question),
        title: Text('Settings', style:  TextStyle(fontSize: 14),),
      ),
    ];
  }
}