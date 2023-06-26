class GetDoctorProfileModel {
  String? message;
  List<Data>? data;

  GetDoctorProfileModel({this.message, this.data});

  GetDoctorProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = <Data>[];
    json['data'].forEach((v) {
      data!.add(Data.fromJson(v));
    });
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
  String? doctorStatus;
  String? fUID;
  int? adminID;
  String? fName;
  String? lName;
  String? email;
  String? pass;
  String? address;
  int? gender;
  String? dOB;
  String? specialization;
  String? phone;
  String? refreshTokenValue;
  String? photo;
  String? bio;
  String? video;
  int? rate;
  int? experince;
  int? patientsNo;
  int? reviewsNo;
  List<Patients>? patients;

  Data(
      {this.iD,
        this.doctorStatus,
        this.fUID,
        this.adminID,
        this.fName,
        this.lName,
        this.email,
        this.pass,
        this.address,
        this.gender,
        this.dOB,
        this.specialization,
        this.phone,
        this.refreshTokenValue,
        this.photo,
        this.bio,
        this.video,
        this.rate,
        this.experince,
        this.patientsNo,
        this.reviewsNo,
        this.patients});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    doctorStatus = json['Doctor_Status'];
    fUID = json['FUID'];
    adminID = json['Admin_ID'];
    fName = json['F_Name'];
    lName = json['L_Name'];
    email = json['Email'];
    pass = json['Pass'];
    address = json['Address'];
    gender = json['Gender'];
    dOB = json['DOB'];
    specialization = json['Specialization'];
    phone = json['Phone'];
    refreshTokenValue = json['Refresh_Token_Value'];
    photo = json['Photo'];
    bio = json['Bio'];
    video = json['Video'];
    rate = json['Rate'];
    experince = json['Experince'];
    patientsNo = json['PatientsNo'];
    reviewsNo = json['ReviewsNo'];
    if (json['patients'] != null) {
      patients = <Patients>[];
      json['patients'].forEach((v) {
        patients!.add(new Patients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Doctor_Status'] = this.doctorStatus;
    data['FUID'] = this.fUID;
    data['Admin_ID'] = this.adminID;
    data['F_Name'] = this.fName;
    data['L_Name'] = this.lName;
    data['Email'] = this.email;
    data['Pass'] = this.pass;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Specialization'] = this.specialization;
    data['Phone'] = this.phone;
    data['Refresh_Token_Value'] = this.refreshTokenValue;
    data['Photo'] = this.photo;
    data['Bio'] = this.bio;
    data['Video'] = this.video;
    data['Rate'] = this.rate;
    data['Experince'] = this.experince;
    data['PatientsNo'] = this.patientsNo;
    data['ReviewsNo'] = this.reviewsNo;
    if (this.patients != null) {
      data['patients'] = this.patients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patients {
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

  Patients(
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

  Patients.fromJson(Map<String, dynamic> json) {
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