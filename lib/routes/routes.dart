import 'package:flutter_app_demo/routes/RoutesObject.dart';
import '../app/AddScreen.dart';
import '../app/MainScreen.dart';
import '../app/NotFoundScreen.dart';
class RoutesConfig {
  static RoutesObject ADD_SCREEN = new RoutesObject('/AddScreen', new AddScreen());
  static RoutesObject MAIN_SCREEN = new RoutesObject('/', new MainScreen());
  static RoutesObject NOT_FOUND_SCREEN = new RoutesObject('/NotFoundScreen', new NotFoundScreen());
}