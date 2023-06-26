class GetPatientProfileModel {
  String? message;
  Data? data;

  GetPatientProfileModel({this.message, this.data});

  GetPatientProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  List<Symptoms>? symptoms;
  List<Doctors>? doctors;

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
        this.phone,
        this.symptoms,
        this.doctors});

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
    if (json['symptoms'] != null) {
      symptoms = <Symptoms>[];
      json['symptoms'].forEach((v) {
        symptoms!.add(new Symptoms.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
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
    if (this.symptoms != null) {
      data['symptoms'] = this.symptoms!.map((v) => v.toJson()).toList();
    }
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symptoms {
  int? id;
  int? patientId;
  String? symptom;

  Symptoms({this.id, this.patientId, this.symptom});

  Symptoms.fromJson(Map<String, dynamic> json) {
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

class Doctors {
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

  Doctors(
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

  Doctors.fromJson(Map<String, dynamic> json) {
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