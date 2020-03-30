import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {

  final String message;

  EmptyScreen({
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 200),
      child: Center(
        child: Text(message, style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center),
      ),
    );
  }
}