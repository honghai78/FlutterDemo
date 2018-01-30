import 'package:flutter/material.dart';

class TabBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'this is tab blue',
            ),
          ],
        ),
      ),
    );
  }
}