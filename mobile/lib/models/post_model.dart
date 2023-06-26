class PostModel{
  late String ? imageUrl;
  late String ? firstName;
  late String ? lastName;
  late bool ? isMale;
  late String ? dateTime;
  late String ? caption;

  PostModel({
    required this.firstName,
    required this.lastName,
    required this.isMale,
    required this.caption,
    required this.dateTime,
    required this.imageUrl,
  });


  PostModel.fromJson(Map<String , dynamic> json){
    imageUrl = json['imageUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isMale = json['isMale'];
    caption = json['caption'];
    dateTime = json['dateTime'];
  }

  Map<String , dynamic> toMap(){
    return {
      'imageUrl':imageUrl,
      'firstName':firstName,
      'lastName':lastName,
      'isMale':isMale,
      'caption': caption,
      'dateTime':dateTime
    };
  }
}