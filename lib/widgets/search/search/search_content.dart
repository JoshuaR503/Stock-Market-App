
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';

import 'package:sma/widgets/search/search_results/search_history.dart';
import 'package:sma/widgets/search/search_results/search_results.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {

        if (state is SearchInitial) {
          // If state is initial, then we will load the saved symbols.
          BlocProvider
          .of<SearchBloc>(context)
          .add(FetchSearchHistory());
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
            
            itemCount: state.symbols.length,
            itemBuilder: (BuildContext ctx, int i) => SearchHistoryWidget(search: state.symbols[i])
          );
        }

        if (state is SearchResults) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            itemCount: state.symbols.length,
            itemBuilder: (BuildContext ctx, int i) => SearchResultsWidget(search: state.symbols[i])
          );
        }

        return Container(
          child: Text('Error'),
        );
      }
    );
  }
}