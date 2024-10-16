import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  String? id;
  String? nameCompetition;
  String? home;
  String? away;
  String? locale;
  String? fase;
  DateTime? date;
  GameModel({
    required this.nameCompetition,
    required this.home,
    required this.away,
    required this.locale,
    required this.fase,
    required this.date,
  });
  factory GameModel.isEmpty() {
    throw UnimplementedError();
  }

  GameModel.fromJson(Map<String, dynamic> json){
    nameCompetition = json["competitionName"];
    home = json["home"];
    away = json["away"];
    locale = json["locale"];
    fase = json["fase"];
    date = (json["date"] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["competitionName"] = nameCompetition;
    data["home"] = home;
    data["away"] = away;
    data["locale"] = locale;
    data["fase"] = fase;
    data["date"] = date;
    return data;
  }
}
