import 'package:flutter/material.dart';
import './BlueObject.dart';


class BlueItemList extends StatefulWidget{

  final BlueObject product;

  BlueItemList(BlueObject product)
      : product = product,
        super(key: new ObjectKey(product));

  @override
  BlueItemState createState() {
    return new BlueItemState(product);
  }
}
class BlueItemState extends State<BlueItemList> {

  final BlueObject product;

  BlueItemState(this.product);


  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
        leading: new CircleAvatar(
          backgroundColor: Colors.blue,
          child: new Image(image: new AssetImage(product.avatar)),
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(product.name)),
            new Checkbox(value: product.isCheck, onChanged: (bool value) {
              setState(() {
                product.isCheck = value;
              });
            })
          ],
        )
    );
  }
}