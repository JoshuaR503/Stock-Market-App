import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/widgets/news/news_card/news_card.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';

import 'package:sma/widgets/widgets/loading_indicator.dart';

class NewsSectionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {

        if (state is NewsInitial) {
          BlocProvider
          .of<NewsBloc>(context)
          .add(FetchNews());
        }

        if (state is NewsError) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: EmptyScreen(message: state.message),
          );
        }

        if (state is NewsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.news.length,
            itemBuilder: (BuildContext context, int index) {

              // Ensure that we don't have empty headlines.
              if (state.news[index].news.isEmpty ) {
                return EmptyScreen(message: 'There are no news related to ${state.news[index].keyWord}.');
              }

              return NewsCardWidget(
                title: state.news[index].keyWord,
                news: state.news[index].news,
              );
            },
          );
        }

        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3,
            left: 4,
            right: 4
          ),
          child: LoadingIndicatorWidget(),
        );
      }
    );
  }

}
