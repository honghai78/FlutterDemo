import 'package:flutter/material.dart';
import '../routes/routes.dart';
class MainScreen extends StatelessWidget {
  void _floatButtonClick(BuildContext context){
    Navigator.pushNamed(context, RoutesConfig.ADD_SCREEN.name);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Main Screen'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '1',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){_floatButtonClick(context);},
        tooltip: 'Open Add Screen',
        child: new Icon(Icons.add),
      ),
    );
  }
}