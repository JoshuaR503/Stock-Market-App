
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/search/search_box/seach_box.dart';

import 'package:sma/widgets/search/search_results/search_history.dart';
import 'package:sma/widgets/search/search_results/search_results.dart';
import 'package:sma/widgets/widgets/base_list.dart';

import 'package:sma/widgets/widgets/loading_indicator.dart';
import 'package:sma/widgets/widgets/message.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

enum ListType {
  searchHistory, 
  searchResults
}

class SearchSection extends StatelessWidget {
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
          return _buildContent(
            child: MessageScreen(message: 'No recent searches', action: Container())
          );
        }

        if (state is SearchResultsLoadingError) {
          return _buildContent(
            child: MessageScreen(message: 'There was an unknown error', action: Container())
          );
        }

        if (state is SearchLoading) {
          return _buildContent(
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: LoadingIndicatorWidget(),
            )
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

  Widget _buildContent({Widget child}) {
    return BaseList(
      children: [
        StandardHeader(
          title: 'Search',
          subtitle: 'Search Companies',
          action: Container(),
        ),

        // Search Box.
        SizedBox(height: 16),
        SearchBoxWidget(),
        SizedBox(height: 16),

        child
      ]
    );
  }

  Widget _buildWrapper({List<StockSearch> data, ListType listType}) {
    return BaseList(
      children: [
        StandardHeader(
          title: 'Search',
          subtitle: 'Search Companies',
          action: Container(),
        ),

        // Search Box.
        SizedBox(height: 16),
        SearchBoxWidget(),
        SizedBox(height: 16),
        
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, int i) {
            return listType == ListType.searchHistory 
            ?  SearchHistoryWidget(search: data[i])
            :  SearchResultsWidget(search: data[i]);
          }
        )
      ]
    );
  }
}
