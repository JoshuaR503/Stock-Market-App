import 'package:flutter/material.dart';
import 'package:sma/helpers/url/url.dart';

import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/shared/styles.dart';

class NewsCardWidget extends StatelessWidget {

  final String title;
  final List<SingleNewModel> news;

  NewsCardWidget({
    @required this.title,
    @required this.news
  }) : assert (news != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        Text(this.title, style: kCompanyNameHeading),
        Container(
          height: 225,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,

            itemCount: news.length,
            itemBuilder: (BuildContext context, int i) => Padding(
              padding: EdgeInsets.only(top: 8, right: 24),
              child: _renderNewsArticle(news[i])
            )
          ),
        )
      ],
    );
  }

  Widget _renderNewsArticle(SingleNewModel singleNew) {

    print(singleNew.title);
    return GestureDetector(
      onTap: () => launchUrl(singleNew.url),
      child: Container(
        width: 200,
        child: Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                singleNew.title, 
                style: TextStyle(
                  height: 1.6,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:  Color(0XFFc2c2c2)
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Container(
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage( image: _imageIsValid(singleNew.urlToImage))
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _imageIsValid(String url) {
    return url == null 
    ? AssetImage('assets/images/default.jpg')
    : NetworkImage(url);
  }
}