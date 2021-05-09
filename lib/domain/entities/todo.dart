class ToDo {
  final int id;
  final String title;
  bool done;

  ToDo({this.id, this.title, this.done = false}) : super();

  ToDo.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'];
}
