
import 'package:flutter/material.dart';
import 'package:sma/models/markets/sector_performance/sector_performance_model.dart';
import 'package:sma/shared/colors.dart';

class SectorPerformance extends StatelessWidget {

  final SectorPerformanceModel performanceData;

  SectorPerformance({
    @required this.performanceData
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        Text('Sector Performance', style: TextStyle(
          color: kGray,
          fontSize: 24,
          fontWeight: FontWeight.w800
        )),

        SizedBox(height: 16),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: performanceData.performanceModelToday.sectors.length,
          itemBuilder: (BuildContext context, int index) => _buildListTile(
            sectorPerformance: performanceData.performanceModelToday.sectors[index]
          )
        ),
      ],
    );
  }
  
  Widget _buildListTile({SingleSectorPerformance sectorPerformance}) {

    final changeString = sectorPerformance.change.replaceFirst(RegExp('%'), ''); 
    final chage = double.parse(changeString);

    return Column(
      children: <Widget>[
        Divider(height: 2),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(sectorPerformance.name, style: TextStyle(
            color: kLighterGray,
          )),

          trailing: Container(
            decoration: BoxDecoration(
              color: chage < 0 ? Colors.red : kPositiveColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            
            width: 96,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
            child: Text(sectorPerformance.change, textAlign: TextAlign.center,),
          ),
        )
      ],
    );
  }
}