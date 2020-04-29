
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/models/search/search.dart';

import 'package:sma/widgets/search/search_results/search_history.dart';
import 'package:sma/widgets/search/search_results/search_results.dart';

import 'package:sma/widgets/widgets/loading_indicator.dart';
import 'package:sma/widgets/widgets/message.dart';

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

        if (state is SearchResultsLoadingError) {
          return MessageScreen(message: state.message, action: Container());
        }

        if (state is SearchData) {
          return _buildWrapper(data: state.data, listType: state.listType);
        }

        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: LoadingIndicatorWidget(),
        );
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
