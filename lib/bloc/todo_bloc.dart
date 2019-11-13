import 'dart:async';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/database/repository.dart';

class TodoBloc {
  final _repository = TodoRepository();

  final _controller = StreamController<List<Todo>>.broadcast();

  get todos => _controller.stream;

  TodoBloc() {
    getTodos();
  }

  getTodos() async {
    _controller.sink.add(await _repository.getAllTodos());
  }

  addTodo() async {
    _controller.sink.add(await _repository.addTodo());
    getTodos();
  }

  deleteTodo(int id) async {
    _controller.sink.add(await _repository.deleteTodo(id));
    getTodos();
  }

  updateTodo(int id) async {
    _controller.sink.add(await _repository.updateTodo(id));
    getTodos();
  }
}