import 'package:todolist/domain/entities/todo.dart';

abstract class TodoRespository {
  Future<List<ToDo>> getAllToDo();
  Future<ToDo> addTodo(ToDo todo);
  Future<ToDo> editTodo(ToDo todo);
  Future<bool> deleteTodo(int id);
}
