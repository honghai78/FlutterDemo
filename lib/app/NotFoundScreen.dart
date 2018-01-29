import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Screen Not Found!'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Screen not found, please check!',
            )
          ],
        ),
      )
    );
  }
}