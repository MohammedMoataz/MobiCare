class EditDoctorModel {
  String? message;
  List<Data>? data;

  EditDoctorModel({this.message, this.data});

  EditDoctorModel.fromJson(Map<String, dynamic> json) {
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
  String? doctorStatus;
  String? fUID;
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
  String? bio;
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