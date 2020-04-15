import 'package:flutter/material.dart';
import 'package:sma/helpers/color_helper.dart';
import 'package:sma/helpers/text_helper.dart';
import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/models/news/symbol_overview_model.dart';
import 'package:sma/shared/styles.dart';

class NewsCardWidget extends StatelessWidget {

  final SymbolOverviewModel symbolOverview;
  final List<SingleNewModel> news;

  NewsCardWidget({
    @required this.symbolOverview,
    @required this.news
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Divider(),
        _renderHeader(),
        _renderNews(),
      ],
    );
  }

  Widget _renderHeader() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(this.symbolOverview.name, style: companyNameHeading),
          
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: sharpBorder,
                color: determineColorBasedOnChange(this.symbolOverview.changesPercentage)
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              width: 80,
              child: Text(determineTextPercentageBasedOnChange(this.symbolOverview.changesPercentage), textAlign: TextAlign.end,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderNews() {
    return Container(
      height: 225,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: EdgeInsets.only(top: 8, right: 16),
            child: _renderNewsArticle(news[i])
          );
        },
      ),
    );
  }

  Widget _renderNewsArticle(SingleNewModel singleNew) {
    return Container(
      width: 230,
      child: Column(
        children: <Widget>[

          Text(
            singleNew.title, 
            style: TextStyle(
              height: 1.5,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color:  Color(0XFFc2c2c2)
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: FadeInImage(
              image: NetworkImage(singleNew.urlToImage), 
              placeholder: NetworkImage('https://media.giphy.com/media/YSvwImOVlXMS15KeNk/giphy.gif')
            )

          )
        ],
      ),
    );
  }
}