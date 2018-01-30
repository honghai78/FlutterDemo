import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import 'package:flutter_app_demo/app/main/BlueTab/TabBlue.dart';
import 'package:flutter_app_demo/app/main/EcoTab/TabEco.dart';
import './BlueTab/BlueObject.dart';
const String _explanatoryText =
    "When the Scaffold's floating action button changes, the new button fades and "
    'turns into view. In this demo, changing tabs can cause the app to be rebuilt '
    'with a FloatingActionButton that the Scaffold distinguishes from the others '
    'by its key.';

class _Page {
  _Page({this.key, this.label, this.colors, this.icon });

  final String label;
  final MaterialColor colors;
  final IconData icon;
  final int key;

  Color get labelColor => colors != null ? colors.shade300 : Colors.grey.shade300;
  bool get fabDefined => colors != null && icon != null;
  Color get fabColor => colors.shade400;
  Icon get fabIcon => new Icon(icon);
  Key get fabKey => new ValueKey<Color>(fabColor);
}

final List<_Page> _allPages = <_Page>[
  new _Page(key: 0,label: 'Blue', colors: Colors.indigo, icon: Icons.add),
  new _Page(key: 1,label: 'Eco', colors: Colors.green, icon: Icons.create),
];

class MainScreen extends StatefulWidget {

  static const String routeName = '/material/tabs-fab';

  @override
  _TabsFabDemoState createState() => new _TabsFabDemoState();
}

class _TabsFabDemoState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _controller;
  _Page _selectedPage;
bool isShow;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
    isShow = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  void _showExplanatoryText(_Page selectPage) {
    if(selectPage.key == 0){
      Navigator.pushNamed(context, RoutesConfig.ADD_SCREEN.name);
    }
    else{
      if(isShow==true){
        setState((){
          isShow = false;
        });
        Navigator.pop(context);
      }
      else{
        _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
          return new Container(
              decoration: new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Theme.of(context).dividerColor))
              ),
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text(_explanatoryText, style: Theme.of(context).textTheme.subhead)
              )
          );
        });
        setState((){
          isShow = true;
        });
      }
    }
  }

  Widget buildTabView(_Page page) {
    if(page.key == 0){
      return new TabBlue(product:
          [
          new BlueObject('Eggs','assets/person.png',false),
          new BlueObject('Flour','assets/person.png',false),
          new BlueObject('Chocolate chips','assets/person.png',false),
          ]);
    }
    else {
      return new TabEco(label: page.label, labelColor: page.labelColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: const Text('Main Page'),
          bottom: new TabBar(
            controller: _controller,
            tabs: _allPages.map((_Page page) => new Tab(text: page.label.toUpperCase())).toList(),
          )
      ),
      floatingActionButton: !_selectedPage.fabDefined ? null : new FloatingActionButton(
          key: _selectedPage.fabKey,
          tooltip: 'Show explanation',
          backgroundColor: _selectedPage.fabColor,
          child: _selectedPage.fabIcon,
          onPressed: (){_showExplanatoryText(_selectedPage);}
      ),
      body: new TabBarView(
          controller: _controller,
          children: _allPages.map(buildTabView).toList()
      ),
    );
  }
}

//  void _floatButtonClick(BuildContext context){
//    Navigator.pushNamed(context, RoutesConfig.ADD_SCREEN.name);
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Main Screen'),
//      ),
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '1',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: (){_floatButtonClick(context);},
//        tooltip: 'Open Add Screen',
//        child: new Icon(Icons.add),
//      ),
//    );
//  }
//}