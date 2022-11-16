import 'package:flutter/material.dart';

import '../features/todo_list/presenter/ui/pages/todo_create_page.dart';
import '../features/todo_list/presenter/ui/pages/todo_main_page.dart';

class Routes {
  static String main = "/";
  static String create = "/create";
}

Route routeHandler(settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => TodoMainPage());
    case "/create":
      return MaterialPageRoute(builder: (context) => TodoCreatePage());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
