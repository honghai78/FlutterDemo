import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:flutter_app_demo/app/main/BlueTab/BlueObject.dart';
import 'package:flutter_app_demo/flux/actions/BlueActions.dart';
class BlueStore extends Store {
  final List<BlueObject> _listBlueObject = <BlueObject>[
    new BlueObject('Eggs','assets/images/person.png',false),
    new BlueObject('Flour','assets/images/person.png',false),
    new BlueObject('Chocolate chips','assets/images/person.png',false),
  ];
  List<BlueObject> get listBlueObject =>
      new List<BlueObject>.unmodifiable(_listBlueObject);

  BlueStore() {
    triggerOnAction(addBlueObjectIntoListAction, (blueObject) {
      _listBlueObject.add(blueObject);
    });
  }
}
final StoreToken blueStoreToken = new StoreToken(new BlueStore());