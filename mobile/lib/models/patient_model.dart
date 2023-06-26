class PatientModel {
  String? message;
  String? accessToken;
  String? refreshToken;
  Data? data;
  String? role;

  PatientModel(
      {this.message,
        this.accessToken,
        this.refreshToken,
        this.data,
        this.role});

  PatientModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['role'] = this.role;
    return data;
  }
}

class Data {
  int ? iD;
  String ? patientStatus;
  String ? fUID;
  String ? fName;
  String ? lName;
  String ? email;
  String ? address;
  int ? gender;
  String ? dOB;
  int ? weight;
  int ? height;
  String ? photo;
  String ? phone;

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
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
    data['ID'] = this.iD;
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