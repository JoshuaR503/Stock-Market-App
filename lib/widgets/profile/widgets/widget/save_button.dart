import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/models/storage/storage.dart';

class WatchlistButtonWidget extends StatefulWidget {

  final Color color;
  final bool isSaved;
  final StorageModel storageModel;

  WatchlistButtonWidget({
    @required this.color,
    @required this.isSaved,
    @required this.storageModel
  });

  @override
  _WatchlistButtonWidgetState createState() => _WatchlistButtonWidgetState();
}

class _WatchlistButtonWidgetState extends State<WatchlistButtonWidget> {

  bool isSaved;
  Color color;
  
  @override
  void initState() {
    this.isSaved = this.widget.isSaved;
    this.color = this.isSaved 
    ? this.widget.color 
    : Color(0X88ffffff);

    super.initState();
  }

  @override
  void dispose() {
    this.isSaved = null;
    this.color = null;

    super.dispose();
  }

  void changeState({bool isSaved, Color color}) {
    setState(() {
      this.isSaved = isSaved;
      this.color = color;
    });
  }

  void onPressedHandler() {

    if (this.isSaved) {
      changeState(isSaved: false, color: Color(0X88ffffff));

      BlocProvider
      .of<PortfolioBloc>(context)
      .add(DeleteProfile(symbol: this.widget.storageModel.symbol));
    } else {
      changeState(isSaved: true, color: this.widget.color);

      BlocProvider
      .of<PortfolioBloc>(context)
      .add(SaveProfile(storageModel: this.widget.storageModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(FontAwesomeIcons.solidBookmark, color: this.color), 
      onPressed: () => onPressedHandler()
    );
  }
}