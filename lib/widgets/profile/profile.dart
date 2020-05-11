import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/helpers/color/color_helper.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/profile/screen.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class Profile extends StatelessWidget {

  final String symbol;
  
  Profile({
    @required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {

        if (state is ProfileLoadingError) {
          return Scaffold(
            appBar: AppBar( 
              backgroundColor: kNegativeColor,
              title: Text(':('),
            ),
            backgroundColor: kScaffoldBackground,
            body: Center(child: EmptyScreen(message: state.error))

          );
        }

        if (state is ProfileLoaded) {
          return ProfileScreen(
            isSaved: state.isSymbolSaved,
            profile: state.profileModel,            
            color: determineColorBasedOnChange(state.profileModel.stockProfile.changes)
          );
        }

        return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: LoadingIndicatorWidget()
        );
      }
    );
  }
}