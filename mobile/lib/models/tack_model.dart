class Task {
  int ? id;
  String ? title;
  String ? description;
  String ? time;

  Task.fromJson(Map<String , dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
  }
}