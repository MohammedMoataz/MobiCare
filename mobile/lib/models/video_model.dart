class VideoModel {
  String? message;
  List<Data>? data;

  VideoModel({this.message, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
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
  int? videoID;
  int? doctorID;
  String? videoURL;
  String? videoDesc;
  String? creationDate;
  String? fName;
  String? lName;
  int? gender;

  Data({this.videoID,
    this.doctorID,
    this.videoURL,
    this.videoDesc,
    this.creationDate,
    this.fName,
    this.lName,
    this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    videoID = json['Video_ID'];
    doctorID = json['Doctor_ID'];
    videoURL = json['Video_URL'];
    videoDesc = json['Video_Desc'];
    creationDate = json['CreationDate'];
    fName = json['F_Name'];
    lName = json['L_Name'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Video_ID'] = this.videoID;
    data['Doctor_ID'] = this.doctorID;
    data['Video_URL'] = this.videoURL;
    data['Video_Desc'] = this.videoDesc;
    data['CreationDate'] = this.creationDate;
    data['F_Name'] = this.fName;
    data['L_Name'] = this.lName;
    data['Gender'] = this.gender;
    return data;
  }
}