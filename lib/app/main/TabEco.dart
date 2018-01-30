import 'package:flutter/material.dart';
import './MainScreen.dart';
class TabEco extends StatelessWidget {
  String label;
  Color labelColor;
  TabEco({this.label, this.labelColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
        key: new ValueKey<String>(label),
        padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
        child: new Card(
            child: new Center(
                child: new Text(label,
                    style: new TextStyle(
                        color: labelColor,
                        fontSize: 32.0
                    ),
                    textAlign: TextAlign.center
                )
            )
        )
    );
  }
}