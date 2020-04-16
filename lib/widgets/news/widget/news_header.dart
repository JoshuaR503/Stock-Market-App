


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/bloc/news/news_bloc.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class NewsHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardHeader(
      title: 'News',
      action: GestureDetector(
        child: FaIcon(FontAwesomeIcons.redoAlt, size: 22,),
        onTap: () {
          // Reload current page to fecth new data.
          BlocProvider
          .of<NewsBloc>(context)
          .add(FetchNews());
        },
      )
    );
  }
}