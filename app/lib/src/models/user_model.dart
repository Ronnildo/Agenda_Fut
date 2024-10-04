class UserModel{
  String? name;
  String? email;
  String? password;
  String? cellPhone;
  String? position;
  String? urlImage;

  UserModel({this.name, this.email, this.password, });

  UserModel.fromJson(Map<String, dynamic> json){
    name = json["name"];
    email = json["email"];
    cellPhone = json["cellPhone"];
    position = json["position"];
    urlImage = json["urlImage"];
  }

  Map<String, dynamic> toJosn(){
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["cellPhone"] = cellPhone;
    data["positon"] = position;
    data["urlImage"] = urlImage;
    return data;
  }
}