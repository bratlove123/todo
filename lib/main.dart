import 'package:flutter/material.dart';
import 'package:todolist/app/pages/todo_screen/todo_screen.dart';

import 'data/setup_locator.dart';

void main() {
  setupLocatorClients();

  runApp(MaterialApp(
    title: 'Todo',
    debugShowCheckedModeBanner: false,
    builder: (context, appChild) {
      return appChild;
    },
    initialRoute: '/',
    routes: {
      '/': (context) => TodoScreen(),
    },
  ));
}
