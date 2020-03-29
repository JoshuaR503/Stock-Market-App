


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SaveButtonProfile extends StatefulWidget {

  final Color color;
  final bool isSaved;

  SaveButtonProfile({
    this.color,
    this.isSaved
  });

  @override
  _SaveButtonProfileState createState() => _SaveButtonProfileState();
}

class _SaveButtonProfileState extends State<SaveButtonProfile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(FontAwesomeIcons.solidCheckCircle, color: this.widget.color,), 
        onPressed: () {
          if (this.widget.isSaved) {
            
          } else {
            
          }
        }
      ),
    );
  }
}