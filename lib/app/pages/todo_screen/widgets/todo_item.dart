import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/utils/dialog_utils.dart';
import 'package:todolist/app/widgets/focused_menu_holder/shelf.dart';
import 'package:todolist/domain/entities/todo.dart';

import '../toto_screen_vm.dart';
import 'add_todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo item;
  const TodoItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ToDoScreenVM>(context);
    final Color menuBackground = Colors.transparent;
    final itemTextStyle = TextStyle(fontSize: 18);
    return FocusedMenuHolder(
      blurSize: 5,
      menuBoxDecoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      duration: Duration(milliseconds: 100),
      animateMenuItems: false,
      blurBackgroundColor: Colors.black54,
      openWithTap: false,
      menuWidth: 320,
      onPressed: () {
        print("123");
      },
      menuItems: [
        FocusedMenuItem(
            title: Text("Edit", style: itemTextStyle),
            backgroundColor: menuBackground,
            trailingIcon: Icon(Icons.edit),
            onPressed: () async {
              final res = await showRoundedDialog(
                  context,
                  AddTodo(
                    init: item.title,
                  ));
              if (res != null) {
                model.edit(ToDo(done: item.done, title: res, id: item.id));
              }
            }),
        FocusedMenuItem(
            backgroundColor: menuBackground,
            title: Text(
              "Delete",
              style: itemTextStyle.copyWith(color: Colors.redAccent),
            ),
            trailingIcon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              model.delete(item);
            })
      ],
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              color: Colors.green,
              child: Text("Mark complete",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            key: Key(item.id.toString()),
            confirmDismiss: (direction) async {
              await model.makeDone(item);
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: item.done,
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (bool value) {},
                  ),
                  Expanded(
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
