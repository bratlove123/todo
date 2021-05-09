import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final String init;
  const AddTodo({Key key, this.init}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.init != null) _controller.text = widget.init;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'What you do?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              controller: _controller,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    primary: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, _controller.text),
                  child: Text('Add'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
