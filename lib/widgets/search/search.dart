
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/models/search/search.dart';

import 'package:sma/widgets/search/search_results/search_history.dart';
import 'package:sma/widgets/search/search_results/search_results.dart';

import 'package:sma/widgets/widgets/loading_indicator.dart';
import 'package:sma/widgets/widgets/message.dart';

enum ListType {
  searchHistory, 
  searchResults
}

class SearchScreenSection extends StatelessWidget {
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
          return MessageScreen(message: 'No recent searches', action: Container());
        }

        if (state is SearchResultsLoadingError) {
          return MessageScreen(message: state.message, action: Container());
        }

        if (state is SearchLoading) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: LoadingIndicatorWidget(),
          );
        }

        if (state is SearchHistoryLoaded) {
          return _buildWrapper(data: state.data, listType: ListType.searchHistory);
        }

        if (state is SearchResults) {
          return _buildWrapper(data: state.data, listType: ListType.searchResults);
        }

        return Container();
      }
    );
  }

  Widget _buildWrapper({List<StockSearch> data, ListType listType}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, int i) {
        return listType == ListType.searchHistory 
        ? SearchHistoryWidget(search: data[i])
        : SearchResultsWidget(search: data[i]);
      }
    );
  }
}
