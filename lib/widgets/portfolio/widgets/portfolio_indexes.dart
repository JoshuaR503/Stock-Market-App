import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/helpers/text_helper.dart';

import 'package:sma/models/profile/market_index.dart';
import 'package:sma/shared/colors.dart';

class PortfolioIndexes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexesBloc, IndexesState>(
      builder: (BuildContext context, IndexesState state) {

        if (state is IndexesInitial) {
          BlocProvider
          .of<IndexesBloc>(context)
          .add(FetchIndexes());
        }

        if (state is IndexesLoaded) {
          return Container(
            height: 80,
            padding: EdgeInsets.zero,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 0),
              physics: BouncingScrollPhysics(),

              scrollDirection: Axis.horizontal,
              itemCount: state.indexes.length,
              itemBuilder: (BuildContext context, int index) => _buildCard( index: state.indexes[index])
            ),
          );
        }

        if (state is IndexesLoadingError) {
          return Center(child: Text(state.error));
        }

        return Container();
      }
    );
  }
  Widget _buildCard({MarketIndexModel index}) {
    return MaterialButton(
      padding: EdgeInsets.only(left: 2, right: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildUpperSection(index: index ),
        ),
        
        width: 100,
      ),
      
      onPressed: () {},
    );
  }

  List<Widget> _buildUpperSection({MarketIndexModel index}) {
    return [
      Text(
        index.indexName,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),

      Text(formatText(index.price), style: TextStyle(
        fontSize: 14,
        color: kLightGray
      )),

      Container(
        decoration: BoxDecoration(
          color: index.changes < 0 ? Colors.red : kPositiveColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        
        width: 90,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(index.changes.toString(),),
      ),
    ];
  }
}