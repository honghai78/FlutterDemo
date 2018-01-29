// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library stocks;

import 'package:flutter/material.dart';
import 'routes/routes.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> {
  ThemeData get theme {
    return new ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  Route<Null> _getRoute(RouteSettings settings) {
    final List<String> path = settings.name.split('/');
    if (path[0] != '')
      return null;
    if (path[1]!='') {
      return new MaterialPageRoute<Null>(
        settings: settings,
        builder: (BuildContext context) => RoutesConfig.NOT_FOUND_SCREEN.screen,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App Demo',
      routes: <String, WidgetBuilder>{
        RoutesConfig.MAIN_SCREEN.name:         (BuildContext context) => RoutesConfig.MAIN_SCREEN.screen,
        RoutesConfig.ADD_SCREEN.name: (BuildContext context) => RoutesConfig.ADD_SCREEN.screen,
      },
      onGenerateRoute: _getRoute,
    );
  }
}

void main() {
  runApp(new App());
}
