import 'package:flutter/material.dart';

import '../features/todo_list/presentation/ui/pages/todo_main_page.dart';

class MainRoutes {
  static String main = "/";
}

Route mainRouteGenerator(settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => TodoMainPage());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
