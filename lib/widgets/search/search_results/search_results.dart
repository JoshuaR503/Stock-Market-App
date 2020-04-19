
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
      title: Text(search.symbol.toUpperCase()),
      onTap: () {
        BlocProvider
        .of<SearchBloc>(context)
        .add(SaveSearch(symbol: search.symbol.toUpperCase()));

        BlocProvider
        .of<ProfileBloc>(context)
        .add(FetchProfileData(symbol: search.symbol));

        Navigator
        .push(context, MaterialPageRoute(builder: (_) => Profile( symbol: search.symbol.toUpperCase())));
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sma/bloc/profile/profile_bloc.dart';
// import 'package:sma/bloc/search/search_bloc.dart';
// import 'package:sma/models/search/search.dart';
// import 'package:sma/respository/search/search.dart';
// import 'package:sma/widgets/profile/profile.dart';
// import 'package:sma/widgets/widgets/loading_indicator.dart';

// class SearchResults extends StatelessWidget {

//   final SearchStockRepository _repository = SearchStockRepository();
//   final String query;

//   SearchResults({
//     this.query
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _repository.searchStock(symbol: query),
//       builder: (BuildContext ctx, AsyncSnapshot<List<StockSearch>> snapshot) {
        
//         if (snapshot.hasData) {

//           return ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext ctx, int i) => ListTile(

//               leading: Icon(Icons.search),
//               title: Text(snapshot.data[i].symbol.toUpperCase()),
//               onTap: () {
//                 BlocProvider
//                 .of<SearchBloc>(context)
//                 .add(SaveSearch(symbol: snapshot.data[i].symbol.toUpperCase()));

//                 Navigator
//                 .push(context, MaterialPageRoute(builder: (_) {
                
//                   BlocProvider
//                   .of<ProfileBloc>(context)
//                   .add(FetchProfileData(symbol: snapshot.data[i].symbol));
                
//                   return Profile( symbol: snapshot.data[i].symbol.toUpperCase());
//                 }));
//               },
//             )
//           );
//         }
        
//         return LoadingIndicatorWidget();
//       },
//     );
//   }
// }