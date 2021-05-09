import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/app/utils/dialog_utils.dart';

import 'toto_screen_vm.dart';
import 'widgets/add_todo.dart';
import 'widgets/list_todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ToDoScreenVM>.reactive(
      viewModelBuilder: () => ToDoScreenVM(),
      onModelReady: (provider) => provider.init(),
      builder: (BuildContext context, ToDoScreenVM model, Widget child) {
        return Scaffold(
          backgroundColor: Colors.orange,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'Todo List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Swipe to complete, long tap to more action'),
                        ),
                        Expanded(child: ListTodo()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              final res = await showRoundedDialog(context, AddTodo());
              if (res != null) {
                model.add(res);
              }
            },
          ),
        );
      },
    );
  }
}
