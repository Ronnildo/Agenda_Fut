class PositionModel{
  String? position;

  PositionModel({this.position});

  PositionModel.fromJson(Map<String, dynamic> json){
    position = json["position"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["position"] = position;
    return data;
  }
}