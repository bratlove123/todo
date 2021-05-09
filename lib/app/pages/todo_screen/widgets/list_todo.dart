import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../toto_screen_vm.dart';
import 'todo_item.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ToDoScreenVM>(context);
    if (model.isBusy) return CircularProgressIndicator();
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemBuilder: (context, index) => TodoItem(
        item: model.todos[index],
      ),
      itemCount: model.todos.length,
    );
  }
}
