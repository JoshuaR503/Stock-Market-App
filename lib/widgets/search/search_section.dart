
import 'package:flutter/material.dart';
import 'package:sma/widgets/search/search.dart';
import 'package:sma/widgets/search/search_box/seach_box.dart';
import 'package:sma/widgets/widgets/base_list.dart';
import 'package:sma/widgets/widgets/standard/header.dart';

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseList(
      children: [
        StandardHeader(
          title: 'Search',
          subtitle: 'Search Companies',
          action: Container(),
        ),

        // Search Box.
        SizedBox(height: 16),
        SearchBoxWidget(),
        SizedBox(height: 16),
        SearchScreenSection()
      ]
    );
  }
}