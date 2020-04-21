

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/models/search/search.dart';
import 'package:sma/widgets/profile/profile.dart';

class SearchHistoryWidget extends StatelessWidget {

  final StockSearch search;

  SearchHistoryWidget({
    @required this.search
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.history),
      title: Text(search.symbol),

      onTap: () {
        Navigator
        .push(context, MaterialPageRoute(builder: (_) => Profile(symbol: search.symbol)));
        
        BlocProvider
        .of<ProfileBloc>(context)
        .add(FetchProfileData(symbol: search.symbol));
      },

      trailing: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(Icons.clear), 
        
        onPressed: () {
          BlocProvider
          .of<SearchBloc>(context)
          .add(DeleteSearch(symbol: search.symbol));
        }
      )
    );
  }
}