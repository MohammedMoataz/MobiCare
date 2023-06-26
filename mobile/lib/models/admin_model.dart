class AdminModel {
  String? accessToken;
  String? refreshToken;
  String? message;
  // String? error;

  AdminModel.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    message = json['message'];
    // error = json['error'];
  }
}