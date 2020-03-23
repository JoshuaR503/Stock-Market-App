import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/respository/search/search.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/profile.dart';

class StockSearchWidget extends SearchDelegate {

  final SearchStockRepository _repository = SearchStockRepository();

  final stocks = ['ba','baba','t','vz','blk','ibm','wm'];
  final searched = ['jpm','bac','adbe','crm','mdb','dis','dal', 'wm'];

  void _tapHandler(context, String symbol) {
    Navigator
    .push(context, MaterialPageRoute(builder: (_) {
      BlocProvider
        .of<ProfileBloc>(context)
        .add(FetchProfileData(symbol: symbol));

      return Profile(
        symbol: symbol.toUpperCase(),
        color: kNegativeColor
      );
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
        
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildSearchResults({List<StockSearch> data, BuildContext context}) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, int i) => ListTile(
        leading: Icon(Icons.history),
        title: Text(data[i].s1Symbol),
        
        onTap: () {
          _tapHandler(context, data[i].s1Symbol);
          showResults(context);
        },
      )
    );
  }

  Widget _buildSearchHistory(BuildContext context) {
    return ListView.builder(
      itemCount: searched.length,
      itemBuilder: (BuildContext ctx, int i) => ListTile(
        leading: Icon(Icons.history),
        title: Text(searched[i].toUpperCase()),
        
        onTap: () {
          _tapHandler(context, searched[i]);
          showResults(context);
        },

        trailing: Icon(Icons.delete, color: kLighterGray,),
      ) 
    );
  }
}