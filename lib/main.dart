import 'package:flutter/material.dart';
import 'package:todo_app/views/todo_list.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoList();
  } 
}

