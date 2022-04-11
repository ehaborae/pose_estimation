class RegisterModel{
  String? token;
  User? user;

  RegisterModel.fromJson(Map<String,dynamic>json)
  {
    token=json["token"];
    user=json["user"]!=null?User.fromJson(json["user"]):null;

  }
}

class User{
  int? id;
  String? username;
  String? email;

//   User({
//     this.id,
//     this.username,
//     this.email,
// });
  User.fromJson(Map<String,dynamic>json)
  {
    id=json["id"];
    username=json["username"];
    email=json["email"];

  }
}