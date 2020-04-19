import 'package:flutter/material.dart';
import 'package:sma/shared/styles.dart';
import 'package:sma/widgets/search/search/search_content.dart';
import 'package:sma/widgets/search/search_box/seach_box.dart';

import 'package:sma/widgets/widgets/base_screen.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: [

        StandardHeader(
          title: 'Search',
          action: Container(),
        ),

        // Section title.
        Text('Search Companies', style: subtitleStyling),

        // Search Box.
        SizedBox(height: 16),
        SearchBoxWidget(),
        SizedBox(height: 16),
        SearchContent(),
        
      ]
    );
        
  }
}

