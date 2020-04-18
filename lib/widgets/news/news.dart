import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/news/news_card/news_card.dart';
import 'package:sma/widgets/news/widget/news_header.dart';
import 'package:sma/widgets/portfolio/widgets/styles.dart';
import 'package:sma/widgets/widgets/base_screen.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class NewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {

        if (state is NewsInitial) {
          BlocProvider
          .of<NewsBloc>(context)
          .add(FetchNews());
        }

        if (state is NewsErrorLoading) {
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: EmptyScreen(message: 'There was an unknown error.'),
          );
        }

        if (state is NewsLoaded) {
          return BaseScreen(
            children: <Widget>[
              NewsHeaderWidget(),
              // Section title.
              Text('Powered by News API', style: kPortfolioScreenDate),

              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.news.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsCardWidget(
                    title: state.news[index].keyWord,
                    news: state.news[index].news,
                  );
                },
              )
            ],
          );
        }

        return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: LoadingIndicatorWidget()
        );
      }
    );
  }
}