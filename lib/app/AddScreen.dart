import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/main/BlueTab/BlueObject.dart';
import 'package:flutter_app_demo/flux/stores/BlueStore.dart';
import 'package:flutter_app_demo/flux/actions/BlueActions.dart';
class AddScreen extends StatefulWidget {

  @override
  AddScreenState createState(){
    return new AddScreenState();
  }
}
class AddScreenState extends State<AddScreen>{
  bool _valueCheckBox;
  TextEditingController _textEditCtrl;
  @override
  void initState() {
    _valueCheckBox = false;
    _textEditCtrl = new TextEditingController(text: '');
  }

  void _submitButtonClick(){
     BlueObject product = new BlueObject(_textEditCtrl.text, 'assets/images/person.png', _valueCheckBox);
     addBlueObjectIntoListAction(product);
     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Add Screen'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      'Enter Product Name:',
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ), new TextField(autofocus: true, decoration: new  InputDecoration(
                      prefixText: 'P-'
                    ),
                      controller: _textEditCtrl,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, bottom: 0.0, right: 0.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      'Is Check?',
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ), new Checkbox(value: _valueCheckBox, onChanged: (bool value){
                        setState((){
                          _valueCheckBox = value;
                        });
                    })
                  ],
                ),
              ), new Center(
                child:
                  new Container(
                    padding: new EdgeInsets.only(left: 0.0, top: 10.0, bottom: 0.0, right: 0.0),
                    child: new RaisedButton(onPressed: _submitButtonClick, child: new Text('Submit'),),
                  )
              )
            ],
          ),
        )
    );
  }
}
