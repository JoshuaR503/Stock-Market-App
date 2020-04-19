

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
        BlocProvider
          .of<ProfileBloc>(context)
          .add(FetchProfileData(symbol: search.symbol));

        Navigator
        .push(context, MaterialPageRoute(builder: (_) {
          return Profile(symbol: search.symbol.toUpperCase());
        }));
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sma/bloc/profile/profile_bloc.dart';
// import 'package:sma/bloc/search/search_bloc.dart';
// import 'package:sma/models/search/search.dart';
// import 'package:sma/widgets/profile/profile.dart';

// class SEARCHHHHHISTORY extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchBloc, SearchState>(
//       builder: (BuildContext context, SearchState state) {
        
//         if (state is SearchInitial) {
//           BlocProvider
//           .of<SearchBloc>(context)
//           .add(FetchSearchHistory());
//         }

//         if (state is SearchLoaded) {
//           return ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: state.symbols.length,
//             itemBuilder: (BuildContext ctx, int i) => _searchHistoryHelper(
//               context: context,
//               search: state.symbols[i] 
//             )
//           );
//         }

//         if (state is SearchEmpty) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Center(
//                 child: Text('No recent seaches'),
//               )
//             ],
//           );
//         }

//         return Container();
//       }
//     );
//   }

//   Widget _searchHistoryHelper({BuildContext context, StockSearch search}) {
//     return ListTile(
//       leading: Icon(Icons.history),
//       title: Text(data.symbol),

//       onTap: () {
//         Navigator
//         .push(context, MaterialPageRoute(builder: (_) {
        
//           BlocProvider
//           .of<ProfileBloc>(context)
//           .add(FetchProfileData(symbol: data.symbol));

//           return Profile( symbol: data.symbol.toUpperCase());
//         }));
//       },

//       trailing: IconButton(
//         highlightColor: Colors.transparent,
//         splashColor: Colors.transparent,
//         icon: Icon(Icons.clear), 
//         onPressed: () {
//           BlocProvider
//           .of<SearchBloc>(context)
//           .add(DeleteSearch(symbol: data.symbol));
//         }
//       )
//     );
//   }
// }