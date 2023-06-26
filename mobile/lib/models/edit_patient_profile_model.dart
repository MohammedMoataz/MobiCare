class EditPatientProfileModel {
  String? message;
  List<Data>? data;

  EditPatientProfileModel({this.message, this.data});

  EditPatientProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? iD;
  String? patientStatus;
  String? fUID;
  String? fName;
  String? lName;
  String? email;
  String? pass;
  String? address;
  int? gender;
  String? dOB;
  int? weight;
  int? height;
  String? refreshTokenValue;
  String? photo;
  String? phone;

  Data(
      {this.iD,
        this.patientStatus,
        this.fUID,
        this.fName,
        this.lName,
        this.email,
        this.pass,
        this.address,
        this.gender,
        this.dOB,
        this.weight,
        this.height,
        this.refreshTokenValue,
        this.photo,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    patientStatus = json['Patient_Status'];
    fUID = json['FUID'];
    fName = json['F_Name'];
    lName = json['L_Name'];
    email = json['Email'];
    pass = json['Pass'];
    address = json['Address'];
    gender = json['Gender'];
    dOB = json['DOB'];
    weight = json['Weight'];
    height = json['Height'];
    refreshTokenValue = json['Refresh_Token_Value'];
    photo = json['Photo'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Patient_Status'] = this.patientStatus;
    data['FUID'] = this.fUID;
    data['F_Name'] = this.fName;
    data['L_Name'] = this.lName;
    data['Email'] = this.email;
    data['Pass'] = this.pass;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Weight'] = this.weight;
    data['Height'] = this.height;
    data['Refresh_Token_Value'] = this.refreshTokenValue;
    data['Photo'] = this.photo;
    data['Phone'] = this.phone;
    return data;
  }
}