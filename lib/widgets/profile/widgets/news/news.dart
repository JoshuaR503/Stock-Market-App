import 'package:flutter/material.dart';
import 'package:sma/models/profile/news/stock_news.dart';
import 'package:sma/shared/colors.dart';

class ProfileNewsScreen extends StatelessWidget {

  final List<StockNews> news;

  ProfileNewsScreen({
    @required this.news
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 26, right: 26, top: 26),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            news[i].headline, style: TextStyle(
              height: 1.5,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ), 
            maxLines: 3, 
            overflow: TextOverflow.ellipsis,
          ),
          
          SizedBox(height: 16),
          Text(
            news[i].source,
            style: TextStyle( color: kLighterGray),
          ),

          SizedBox(height: 8),
          Text(
            news[i].summary, style: TextStyle(
              color: kLighterGray, 
              height: 1.8
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          
          SizedBox(height: 8),
          Divider(),
        ],
      )
    );
  }
}