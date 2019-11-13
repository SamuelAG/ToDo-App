import 'package:todo_app/database/database.dart';

class TodoRepository {
  final DataBase dataBase = DataBase();

  Future getAllTodos() => dataBase.getTodos();
  Future addTodo() => dataBase.addTodo();
  Future deleteTodo(int id) => dataBase.deleteTodo(id);
  Future updateTodo(int id) => dataBase.updateTodo(id);
}