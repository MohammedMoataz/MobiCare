class PatientDoctorListModel {
  String? message;
  List<Data>? data;

  PatientDoctorListModel({this.message, this.data});

  PatientDoctorListModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorID;
  String? doctorStatus;
  String? fUID;
  String? fName;
  String? lName;
  String? email;
  String? address;
  int? gender;
  String? dOB;
  String? specialization;
  String? phone;
  String? photo;
  String? bio;

  Data(
      {this.doctorID,
        this.doctorStatus,
        this.fUID,
        this.fName,
        this.lName,
        this.email,
        this.address,
        this.gender,
        this.dOB,
        this.specialization,
        this.phone,
        this.photo,
        this.bio});

  Data.fromJson(Map<String, dynamic> json) {
    doctorID = json['Doctor_ID'];
    doctorStatus = json['Doctor_Status'];
    fUID = json['FUID'];
    fName = json['F_Name'];
    lName = json['L_Name'];
    email = json['Email'];
    address = json['Address'];
    gender = json['Gender'];
    dOB = json['DOB'];
    specialization = json['Specialization'];
    phone = json['Phone'];
    photo = json['Photo'];
    bio = json['Bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor_ID'] = this.doctorID;
    data['Doctor_Status'] = this.doctorStatus;
    data['FUID'] = this.fUID;
    data['F_Name'] = this.fName;
    data['L_Name'] = this.lName;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Specialization'] = this.specialization;
    data['Phone'] = this.phone;
    data['Photo'] = this.photo;
    data['Bio'] = this.bio;
    return data;
  }
}