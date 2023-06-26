class GetSymptomsModel {
  String? message;
  List<Data>? data;

  GetSymptomsModel({this.message, this.data});

  GetSymptomsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? patientId;
  String? symptom;

  Data({this.id, this.patientId, this.symptom});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    symptom = json['symptom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['symptom'] = this.symptom;
    return data;
  }
}