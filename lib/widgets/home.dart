import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  PageController _pageController = PageController(
    initialPage: 0, 
    keepPage: false
  );

  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children:<Widget>[

          Portfolio(),

          Center(
            child: Text(
              'Worldwide Markets coming soon.',
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
              'Stock Market news coming soon.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ]
      ),

      backgroundColor: kScaffoldBackground,
      bottomNavigationBar: SnakeNavigationBar(
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
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.suitcase),
            title: Text('Stonks', style:  TextStyle(fontSize: 14),),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidNewspaper),
            title: Text('News', style:  TextStyle(fontSize: 14),),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globeAmericas),
            title: Text('Markets', style:  TextStyle(fontSize: 14),),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            title: Text('Search', style:  TextStyle(fontSize: 14),),
          ),
        ],
        currentIndex: _selectedIndex,
        onPositionChanged: (index) {
          _onItemTapped(index);
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}