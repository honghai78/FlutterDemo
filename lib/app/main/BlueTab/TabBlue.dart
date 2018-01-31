import 'package:flutter/material.dart';
import './BlueObject.dart';
import './BlueItemList.dart';
import 'package:flutter_app_demo/flux/stores/BlueStore.dart';
import 'package:flutter_flux/flutter_flux.dart';

class TabBlue extends StatefulWidget {
  TabBlue({Key key}) :super(key: key);

  @override
  BlueListState createState() {
    return new BlueListState();
  }
}

class BlueListState extends State<TabBlue>
    with StoreWatcherMixin<TabBlue> {
  BlueStore blueStore;
  List<BlueObject> product;

  @override
  void initState() {
    blueStore = listenToStore(blueStoreToken, handleBlueListStoreChange);
    product = blueStore.listBlueObject;
  }

  void handleBlueListStoreChange(BlueStore blueStore) {
      product = blueStore.listBlueObject;
  }

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
                children: product.map((BlueObject product) {
                  return new BlueItemList(product);
                }).toList(),
              )),
            ],
          ),
        )
    );
  }
}