import 'package:flutter/material.dart';
import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/shared/styles.dart';

class NewsCardWidget extends StatelessWidget {

  final String title;
  final List<SingleNewModel> news;

  NewsCardWidget({
    @required this.title,
    @required this.news
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        Text(this.title, style: companyNameHeading),
        _renderNews(),
      ],
    );
  }

  Widget _renderNews() {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: EdgeInsets.only(top: 4, right: 16),
            child: _renderNewsArticle(news[i])
          );
        },
      ),
    );
  }

  Widget _renderNewsArticle(SingleNewModel singleNew) {
    return Container(
      width: 200,
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
            padding: EdgeInsets.symmetric(vertical: 8),
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