import 'package:flutter/material.dart';

import 'package:sma/helpers/color/color_helper.dart';
import 'package:sma/models/markets/sector_performance/sector_performance_model.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/shared/styles.dart';

class SectorPerformance extends StatelessWidget {

  final SectorPerformanceModel performanceData;

  SectorPerformance({
    @required this.performanceData
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      padding: EdgeInsets.only(top: 16),
      physics: NeverScrollableScrollPhysics(),
      itemCount: performanceData.performanceModelToday.sectors.length,
      itemBuilder: (BuildContext context, int index) => _buildListTile(
        sectorPerformance: performanceData.performanceModelToday.sectors[index]
      )
    );
  }
  
  Widget _buildListTile({SingleSectorPerformance sectorPerformance}) {

    final changeString = sectorPerformance.change.replaceFirst(RegExp('%'), ''); 
    final change = double.parse(changeString);
    final width = change > 9.99 ? null : 75.5;

    return Column(
      children: <Widget>[
        Divider(height: 2),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(sectorPerformance.name, style: TextStyle(color: kLighterGray)),

          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: kSharpBorder,
              color: determineColorBasedOnChange(change),
            ),
            
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(sectorPerformance.change, textAlign: TextAlign.center,),
          ),
        )
      ],
    );
  }
}