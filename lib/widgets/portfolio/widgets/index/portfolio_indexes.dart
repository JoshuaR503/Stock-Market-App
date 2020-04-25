import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/widgets/portfolio/widgets/index/portfolio_index.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';

class PortfolioIndexeSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesBloc, IndexesState>(
      builder: (BuildContext context, IndexesState state) {

        if (state is IndexesInitial) {
          BlocProvider
          .of<IndexesBloc>(context)
          .add(FetchIndexes());
        }

        if (state is IndexesLoadingError) {
          return EmptyScreen(message: 'There was an error loading the Indexes. Try again later.');
        }

        if (state is IndexesLoaded) {
          return Container(
            height: 75,
            margin: EdgeInsets.only(top: 16, bottom: 16),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              
              scrollDirection: Axis.horizontal,
              itemCount: state.indexes.length,
              itemBuilder: (BuildContext context, int index) {
                return PortfolioIndexWidget(index: state.indexes[index]);
              }
            ),
          );
        }
        
        return Container( height: 75 );
      }
    );
  }
}