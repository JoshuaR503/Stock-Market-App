
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/news/news_bloc.dart';

import 'package:sma/models/news/news.dart';
import 'package:sma/widgets/news/news_card/news_card.dart';
import 'package:sma/widgets/widgets/base_screen.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class NewsSectionWidget extends StatelessWidget {

  final List<NewsDataModel> news;

  NewsSectionWidget({
    @required this.news
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: <Widget>[

        StandardHeader(
          title: 'Latest News',
          subtitle: 'Portfolio Related',
          action: Container(),
        ),

        SizedBox(height: 8),

        // Content.
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) => NewsCardWidget(
            title: news[index].keyWord,
            news: news[index].news,
          ),
        )
      ],

      onRefresh: () async {
        BlocProvider
        .of<NewsBloc>(context)
        .add(FetchNews());
      },
    );
  }
}