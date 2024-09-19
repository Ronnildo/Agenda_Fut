class GameModel {
  String? nameCompetition;
  String? home;
  String? away;
  String? locale;
  DateTime? date;

  GameModel({
    required this.nameCompetition,
    required this.home,
    required this.away,
    required this.locale,
    required this.date,
  });

  GameModel.fromJson(Map<String, dynamic> json){
    nameCompetition = json["competicao"];
    home = json["casa"];
    away = json["fora"];
    locale = json["local"];
    date = json["data"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};
    data["competicao"] = nameCompetition;
    data["casa"] = home;
    data["fora"] = away;
    data["local"] = locale;
    data["data"] = date;
    return data;
  }
}
