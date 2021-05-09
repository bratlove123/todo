import 'package:todolist/domain/entities/todo.dart';
import 'package:todolist/domain/repositories/todo_respository.dart';

class DataToDoRepository extends TodoRespository {
  List<ToDo> todos;
  // sigleton
  static final DataToDoRepository _instance = DataToDoRepository._internal();
  DataToDoRepository._internal() {
    todos = <ToDo>[];
    todos.addAll([
      ToDo(id: 1, title: 'Clean the house'),
      ToDo(id: 2, title: 'Buy laptop'),
    ]);
  }
  factory DataToDoRepository() => _instance;

  @override
  Future<List<ToDo>> getAllToDo() async {
    return todos;
  }

  @override
  Future<ToDo> addTodo(ToDo todo) async {
    todos.add(todo);
    return todo;
  }

  @override
  Future<ToDo> editTodo(ToDo todo) async {
    try {
      todos.removeWhere((e) => e.id == todo.id);
      todos.add(todo);
      return todo;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Future<bool> deleteTodo(int id) {
    try {
      todos.removeWhere((e) => e.id == id);
      return Future.value(true);
    } catch (ex) {
      print(ex);
      return Future.value(false);
    }
  }
}
