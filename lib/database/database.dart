import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/Models/todo.dart';

class DataBase {
  final client = http.Client();

  addTodo(String title, String desc, String date) async {
    var url = "http://10.0.2.2:5000/todo";

    Map<String, dynamic> jsonMap = {
      "Title": title,
      "Description":
          desc,
      "DueDate": "Date('$date')"
    };

    await client
        .post(url,
            headers: {'Content-type': 'application/json'},
            body: jsonEncode(jsonMap))
        .then((http.Response r) => r.body)
        .whenComplete(() => print("add completed"));
  }

  deleteTodo(int id) async {
    var url = "http://10.0.2.2:5000/delete/$id";

    await client
        .delete(url)
        .then((http.Response r) => r.body)
        .whenComplete(() => print("delete completed"));
  }

  updateTodo(int id) async {
    var url = "http://10.0.2.2:5000/update/$id";

    await client
        .put(url)
        .then((http.Response r) => r.body)
        .whenComplete(() => print("update completed"));
  }

  getTodos() async {
    var url = "http://10.0.2.2:5000/todos";
    
    final response = await client.get(url);
    var list = (json.decode(response.body) as List)
        .map((data) => Todo.fromJson(data))
        .toList();
    //print(response.body);
    return list;
  }
}
