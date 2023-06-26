class DoctorModel {
  String? message;
  String? accessToken;
  String? refreshToken;
  Data? data;
  List<DoctorPatients>? doctorPatients;
  String? role;

  DoctorModel(
      {this.message,
        this.accessToken,
        this.refreshToken,
        this.data,
        this.doctorPatients,
        this.role});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['doctorPatients'] != null) {
      doctorPatients = <DoctorPatients>[];
      json['doctorPatients'].forEach((v) {
        doctorPatients!.add(new DoctorPatients.fromJson(v));
      });
    }
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
    if (this.doctorPatients != null) {
      data['doctorPatients'] =
          this.doctorPatients!.map((v) => v.toJson()).toList();
    }
    data['role'] = this.role;
    return data;
  }
}

class Data {
  int? iD;
  String? doctorStatus;
  String ? fUID;
  int? adminID;
  String? fName;
  String? lName;
  String? email;
  String? address;
  int? gender;
  String? dOB;
  String? specialization;
  String? phone;
  String? photo;
  String ? bio;
  String? video;
  int? rate;
  int? experince;
  int? patientsNo;
  int? reviewsNo;

  Data(
      {this.iD,
        this.doctorStatus,
        this.fUID,
        this.adminID,
        this.fName,
        this.lName,
        this.email,
        this.address,
        this.gender,
        this.dOB,
        this.specialization,
        this.phone,
        this.photo,
        this.bio,
        this.video,
        this.rate,
        this.experince,
        this.patientsNo,
        this.reviewsNo});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    doctorStatus = json['Doctor_Status'];
    fUID = json['FUID'];
    adminID = json['Admin_ID'];
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
    video = json['Video'];
    rate = json['Rate'];
    experince = json['Experince'];
    patientsNo = json['PatientsNo'];
    reviewsNo = json['ReviewsNo'];
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
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Specialization'] = this.specialization;
    data['Phone'] = this.phone;
    data['Photo'] = this.photo;
    data['Bio'] = this.bio;
    data['Video'] = this.video;
    data['Rate'] = this.rate;
    data['Experince'] = this.experince;
    data['PatientsNo'] = this.patientsNo;
    data['ReviewsNo'] = this.reviewsNo;
    return data;
  }
}

class DoctorPatients {
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

  DoctorPatients(
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

  DoctorPatients.fromJson(Map<String, dynamic> json) {
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