import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/database/database.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DataBase dataBase = DataBase();
  
  final TodoBloc bloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      body: StreamBuilder(
        stream: bloc.todos,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Todo todo = snapshot.data[index];
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    bloc.deleteTodo(todo.id);
                  },
                  background: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadiusDirectional.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 35, 0, 8),
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      title: Text(todo.title),
                      leading: Checkbox(
                        value: todo.isDone,
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          bloc.updateTodo(todo.id);
                        },
                      ),
                      subtitle: Text(todo.description),
                      isThreeLine: true,
                    ),
                  ),
                  key: UniqueKey(),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.addTodo();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
