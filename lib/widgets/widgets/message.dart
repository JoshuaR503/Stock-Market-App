import 'package:flutter/material.dart';
import 'package:sma/widgets/widgets/empty_screen.dart';

class MessageScreen extends StatelessWidget {

  final String message;
  final Widget action;

  MessageScreen({
    @required this.message,
    @required this.action
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
      child: Column(
        children: <Widget>[
          EmptyScreen(message: message),
        ],
      )
    );
  }
}