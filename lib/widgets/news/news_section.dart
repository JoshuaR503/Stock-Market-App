import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/news/news.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class NewsSection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: RefreshIndicator(

        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [

              StandardHeader(
                title: 'Latest News',
                subtitle: 'Portfolio Related',
                action: Container(),
              ),

              NewsSectionWidget()
            ]
          )
        ),

        onRefresh: () async {
          // Reload markets section.
          BlocProvider
          .of<NewsBloc>(context)
          .add(FetchNews());
        },
      )
    );
  }
}