class TaskModel {
  int ? id;
  String ? name;
  String ? description;
  String ? time;

  TaskModel({required this.id, required this.name, required this.description, required this.time});

  TaskModel.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    time = json['time'];
  }

  static TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        time: map['time']
    );
  }
}