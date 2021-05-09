import 'package:stacked/stacked.dart';
import 'package:todolist/data/data_toto_repo.dart';
import 'package:todolist/data/setup_locator.dart';
import 'package:todolist/domain/entities/todo.dart';
import 'package:todolist/domain/repositories/todo_respository.dart';

class ToDoScreenVM extends BaseViewModel {
  final TodoRespository _client = locator<DataToDoRepository>();

  List<ToDo> _todos;
  List<ToDo> get todos => _todos;

  Future<void> init() async {
    setBusy(true);
    _todos = await _client.getAllToDo();
    setBusy(false);
  }

  Future<void> add(String todoStr) async {
    setBusy(true);
    await _client.addTodo(ToDo(id: _todos.last.id + 1, title: todoStr));
    setBusy(false);
  }

  Future<void> edit(ToDo todo) async {
    setBusy(true);
    await _client.editTodo(todo);
    setBusy(false);
  }

  Future<void> delete(ToDo todo) async {
    setBusy(true);
    await _client.deleteTodo(todo.id);
    setBusy(false);
  }

  Future<void> makeDone(ToDo todo) async {
    setBusy(true);
    todo.done = !todo.done;
    await _client.editTodo(todo);
    setBusy(false);
  }
}
