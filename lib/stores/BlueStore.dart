import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import '../app/main/BlueTab/BlueObject.dart';

final List<BlueObject> _listBlueObject = <BlueObject>[];
class BlueStore extends Store{
  BlueStore(){
    triggerOnAction(addBlueObjectIntoListAction, (blueObject){
      _listBlueObject.add(blueObject);
    });
  }
}

final StoreToken blueStoreToken = new StoreToken(new BlueStore());
final Action<BlueObject> addBlueObjectIntoListAction = new Action<BlueObject>();