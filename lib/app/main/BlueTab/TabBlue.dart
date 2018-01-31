import 'package:flutter/material.dart';
import './BlueObject.dart';
import './BlueItemList.dart';

class TabBlue extends StatefulWidget {
  List<BlueObject> product;
  TabBlue({Key key, this.product}) :super(key: key);
  @override
  BlueListState createState() {
    return new BlueListState();
  }
}

class BlueListState extends State<TabBlue>
   {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.product.map((BlueObject product) {
                  return new BlueItemList(product);
                }).toList(),
              )),
            ],
          ),
        )
    );
  }
}