class DoctorPatientListModel {
  String? message;
  List<Data>? data;

  DoctorPatientListModel({this.message, this.data});

  DoctorPatientListModel.fromJson(Map<String, dynamic> json) {
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
  int? patientID;
  String? patientStatus;
  String? fUID;
  String? fName;
  String? lName;
  String? email;
  String? address;
  int? gender;
  String? dOB;
  int? weight;
  int? height;
  String? photo;
  String? phone;

  Data(
      {this.patientID,
        this.patientStatus,
        this.fUID,
        this.fName,
        this.lName,
        this.email,
        this.address,
        this.gender,
        this.dOB,
        this.weight,
        this.height,
        this.photo,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    patientID = json['Patient_ID'];
    patientStatus = json['Patient_Status'];
    fUID = json['FUID'];
    fName = json['F_Name'];
    lName = json['L_Name'];
    email = json['Email'];
    address = json['Address'];
    gender = json['Gender'];
    dOB = json['DOB'];
    weight = json['Weight'];
    height = json['Height'];
    photo = json['Photo'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Patient_ID'] = this.patientID;
    data['Patient_Status'] = this.patientStatus;
    data['FUID'] = this.fUID;
    data['F_Name'] = this.fName;
    data['L_Name'] = this.lName;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Weight'] = this.weight;
    data['Height'] = this.height;
    data['Photo'] = this.photo;
    data['Phone'] = this.phone;
    return data;
  }
}