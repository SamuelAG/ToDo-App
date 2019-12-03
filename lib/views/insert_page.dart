import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/bloc/todo_bloc.dart';

class InsertPage extends StatefulWidget {

  final TodoBloc bloc;
  InsertPage({this.bloc});

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final name = TextEditingController();

  final desc = TextEditingController();

  final price = TextEditingController();

  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Adicionar"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {
            String date = "${_date.year}-${_date.month}-${_date.day}";
            widget.bloc.addTodo(name.text, desc.text, date);
            Navigator.pop(context);
          })
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: Icon(Icons.title),
            title: new TextField(
              controller: name, 
              decoration: new InputDecoration(
                hintText: "Nome",
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          new ListTile(
            leading: Icon(Icons.view_headline),
            title: new TextField(
              controller: desc,
              decoration: new InputDecoration(
                hintText: "Descrição",
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          new ListTile(
            leading: Icon(Icons.date_range),
            title: Text("Data"),
            subtitle: Text("${_date.day}/${_date.month}/${_date.year}"),
            onTap: () {
              DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2020, 12, 30), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              _date = date;
                            });
                          }, currentTime: DateTime.now(), locale: LocaleType.pt);
            },
          ),
        ],
      ),
    );
  }
}
