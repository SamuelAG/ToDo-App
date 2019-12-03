import 'package:todo_app/database/database.dart';

class TodoRepository {
  final DataBase dataBase = DataBase();

  Future getAllTodos() => dataBase.getTodos();
  Future addTodo(String title, String desc, String date) => dataBase.addTodo(title, desc, date);
  Future deleteTodo(int id) => dataBase.deleteTodo(id);
  Future updateTodo(int id) => dataBase.updateTodo(id);
}