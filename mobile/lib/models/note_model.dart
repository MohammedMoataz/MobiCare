class NoteModel {
  String? message;
  List<Data>? data;

  NoteModel({this.message, this.data});

  NoteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? noteID;
  int? patientID;
  int? doctorID;
  String? noteContent;
  String? creationDate;

  Data(
      {this.noteID,
        this.patientID,
        this.doctorID,
        this.noteContent,
        this.creationDate});

  Data.fromJson(Map<String, dynamic> json) {
    noteID = json['Note_ID'];
    patientID = json['Patient_ID'];
    doctorID = json['Doctor_ID'];
    noteContent = json['NoteContent'];
    creationDate = json['Creation_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Note_ID'] = this.noteID;
    data['Patient_ID'] = this.patientID;
    data['Doctor_ID'] = this.doctorID;
    data['NoteContent'] = this.noteContent;
    data['Creation_Date'] = this.creationDate;
    return data;
  }
}