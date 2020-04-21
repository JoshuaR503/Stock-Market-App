
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/widgets/profile/profile.dart';

class SearchResultsWidget extends StatelessWidget {

  final StockSearch search;

  SearchResultsWidget({
    @required this.search
  });
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: Text(search.symbol),
      onTap: () {

        Navigator
        .push(context, MaterialPageRoute(builder: (_) => Profile( symbol: search.symbol)));

        // Save event.
        BlocProvider
        .of<SearchBloc>(context)
        .add(SaveSearch(symbol: search.symbol));

        // Fetch profile event.
        BlocProvider
        .of<ProfileBloc>(context)
        .add(FetchProfileData(symbol: search.symbol));
      },
    );
  }
}