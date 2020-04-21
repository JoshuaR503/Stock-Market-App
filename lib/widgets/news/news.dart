import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/news/news_section.dart';
import 'package:sma/widgets/widgets/base_list.dart';

import 'package:sma/widgets/widgets/loading_indicator.dart';
import 'package:sma/widgets/widgets/message.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

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

        if (state is NewsEmpty) {
          return _buildWrapper(child: MessageScreen(
            message: state.message,
            action: _actionWidget(context),
          ));
        }

        if (state is NewsErrorLoading) {
          return _buildWrapper(child: MessageScreen(
            message: state.message,
            action: _actionWidget(context)
          ));
        }

        if (state is NewsLoading) {
          return Scaffold(
            backgroundColor: kScaffoldBackground,
            body: LoadingIndicatorWidget()
          );
        }

        if (state is NewsLoaded) {
          return NewsSectionWidget(news: state.news);
        }

        return Container();
      }
    );
  }

  Widget _buildWrapper({Widget child}) {
    return BaseList(
      children: <Widget>[
        
        StandardHeader(
          title: 'Latest News',
          subtitle: 'Portfolio Related',
          action: Container()
        ),
        
        child,
      ],
    );
  }

  Widget _actionWidget(BuildContext context) {
    return GestureDetector(
      child: Padding(
        child: Icon(Icons.refresh),
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
      onTap: () {
        BlocProvider
        .of<NewsBloc>(context)
        .add(FetchNews());
      },
    );
  }
}
