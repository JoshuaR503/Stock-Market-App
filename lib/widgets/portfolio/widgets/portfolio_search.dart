import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/bloc/search_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';

import 'package:sma/respository/search/search.dart';
import 'package:sma/models/search/search.dart';

import 'package:sma/widgets/profile/profile.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class PortfolioSearch extends SearchDelegate {

  final SearchStockRepository _repository = SearchStockRepository();

  void _tapHandler(context, String symbol) async {

    Navigator
    .push(context, MaterialPageRoute(builder: (_) {

      BlocProvider
      .of<ProfileBloc>(context)
      .add(FetchProfileData(symbol: symbol));

      BlocProvider
      .of<ProfileBloc>(context)
      .add(FetchProfileData(symbol: symbol));

    
      return Profile( symbol: symbol.toUpperCase());
    }));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.clear), 
        onPressed: () => query = ''
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), 
      onPressed: () => close( context, null)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchHistory(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return _buildSearchHistory(context);
    }

    return FutureBuilder(
      future: _repository.searchStock(symbol: query),
      builder: (BuildContext ctx, AsyncSnapshot<List<StockSearch>> snapshot) {
        
        if (snapshot.hasData) {
          return _buildSearchResults(data: snapshot.data, context: ctx);
        }
        
        return LoadingIndicatorWidget();
      },
    );
  }

  Widget _renderListTile({BuildContext context, String text}) {
    return ListTile(
      title: Text(text.toUpperCase()),
      leading: Icon(Icons.history),
      onTap: () {
        _tapHandler(context, text.toUpperCase());
        showResults(context);
      },
    );
  }

  Widget _buildSearchResults({List<StockSearch> data, BuildContext context}) {


    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, int i) => ListTile(
        title: Text(data[i].s1Symbol.toUpperCase()),
        leading: Icon(Icons.history),
        onTap: () {
          BlocProvider
          .of<SearchBloc>(context)
          .add(SaveSearch(symbol: data[i].s1Symbol.toUpperCase()));

          _tapHandler(context, data[i].s1Symbol.toUpperCase());
          showResults(context);
        },
      )
    );
  }

  Widget _buildSearchHistory(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(

      builder: (BuildContext context, SearchState state) {

        if (state is SearchInitial) {
          BlocProvider
          .of<SearchBloc>(context)
          .add(FetchSearchHistory());
        }

        if (state is SearchLoaded) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.symbols.length,
            itemBuilder: (BuildContext ctx, int i) => _renderListTile(
              context: context, 
              text: state.symbols[i]
            )
          );
        } 

        return Container();
      }
    );
  }
}