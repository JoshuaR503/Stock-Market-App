
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';

import 'package:sma/widgets/search/search_results/search_history.dart';
import 'package:sma/widgets/search/search_results/search_results.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {

        if (state is SearchInitial) {
          BlocProvider
          .of<SearchBloc>(context)
          .add(FetchSearchHistory());
        }

        if (state is SearchEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: EmptyScreen(message: 'No recent searches'),
          );
        }

        if (state is SearchLoading) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
            child: LoadingIndicatorWidget(),
          );
        }

        if (state is SearchHistoryLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            
            itemCount: state.data.length,
            itemBuilder: (BuildContext ctx, int i) => 
              SearchHistoryWidget(search: state.data[i])
          );
        }

        if (state is SearchResults) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            itemCount: state.data.length,
            itemBuilder: (BuildContext ctx, int i) => 
              SearchResultsWidget(search: state.data[i])
          );
        }

        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: EmptyScreen(message: 'There was an unknwon error.'),
        );
      }
    );
  }
}