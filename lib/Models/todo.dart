class Todo {
  final int id;
  final String title;
  final String description;
  final bool isDone;
  final String dueDate;

  Todo({this.isDone, this.id, this.title, this.description, this.dueDate});

  Todo.fromJson(Map json) : 
      id = json['Id'],
      title = json['Title'],
      description = json['Description'],
      isDone = json['_is_done'] == 1,
      dueDate = formatData(json['DueDate']);

  static formatData(String date) {
    date = date.substring(6, date.length-2);
    var dates = date.split("-");
    return "${dates[2]}/${dates[1]}/${dates[0]}";
  }
}