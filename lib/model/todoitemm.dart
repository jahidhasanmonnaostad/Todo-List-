class ToDo {
  String? id;
  String? title;
  bool isDone;

  ToDo(this.id, this.title, this.isDone);

  static List<ToDo> todoList() {
    return [
      ToDo("20", "raja ", true),
      ToDo("20", "raja ", true),
      ToDo("20", "raja ", true),
      ToDo("20", "raja ", true),
    ];
  }
}