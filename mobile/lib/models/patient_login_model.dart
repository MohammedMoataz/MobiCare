class PatientLoginModel {
  String ? message;
  String ? accessToken;
  String ? refreshToken;
  Data ? data;
  String ? role;

  PatientLoginModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.data,
    required this.role,
  });

  PatientLoginModel.fromJson(Map<String , dynamic> json){
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int ? id;
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
  String ? symptoms;
  String ? phone;

  Data({
    required this.id,
    required this.patientStatus ,
    required this.fUID,
    required this.fName,
    required this.lName,
    required this.email,
    required this.address,
    required this.height,
    required this.weight,
    required this.dOB,
    required this.gender,
    required this.symptoms,
    required this.phone,
    required this.photo,
  });

  Data.fromJson(Map<String , dynamic> json){
    id = json['ID'];
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
    symptoms = json['Symptoms'];
    phone = json['Phone'];
  }
}