import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class GameModel {
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
    nameCompetition = json["competicao"];
    home = json["casa"];
    away = json["fora"];
    locale = json["local"];
    fase = json["fase"];
    date = (json["data"] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["competicao"] = nameCompetition;
    data["casa"] = home;
    data["fora"] = away;
    data["local"] = locale;
    data["fase"] = fase;
    data["data"] = date;
    return data;
  }
}
