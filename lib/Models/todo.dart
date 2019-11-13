class Todo {
  final int id;
  final String title;
  final String description;
  final bool isDone;

  Todo({this.isDone, this.id, this.title, this.description});

  Todo.fromJson(Map json) : 
      id = json['Id'],
      title = json['Title'],
      description = json['Description'],
      isDone = json['_is_done'] == 1;

}