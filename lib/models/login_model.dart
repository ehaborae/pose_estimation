class LoginModel {
  String? expiry;
  String? token;

  LoginModel({this.expiry, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    expiry = json["expiry"];
    token = json["token"];
  }
}
