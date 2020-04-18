import 'package:flutter/material.dart';
import 'package:sma/helpers/url/url.dart';
import 'package:sma/key.dart';
import 'package:sma/models/news/single_new_model.dart';
import 'package:sma/shared/styles.dart';

class NewsCardWidget extends StatelessWidget {

  final String title;
  final String companyLogo;
  final List<SingleNewModel> news;

  NewsCardWidget({
    @required this.companyLogo,
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
        Container(
          height: 220,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsets.only(top: 8, right: 24),
                child: _renderNewsArticle(news[i])
              );
            },
          ),
        )
      ],
    );
  }

  Widget _renderNewsArticle(SingleNewModel singleNew) {
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

            FadeInImage(
              image: _imageIsValid(singleNew.urlToImage),
              placeholder: NetworkImage(companyLogo)
            )

          ],
        ),
      ),
    );
  }

  NetworkImage _imageIsValid(dynamic url) {
    return url == null 
    ? NetworkImage(defaultPicture)
    : NetworkImage(url);
  }
}