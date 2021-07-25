// To parse this JSON data, do
//
//     final userApiModel = userApiModelFromJson(jsonString);

import 'dart:convert';

UserApiModel userApiModelFromJson(String str) => UserApiModel.fromJson(json.decode(str));

String userApiModelToJson(UserApiModel data) => json.encode(data.toJson());

class UserApiModel {
  UserApiModel({
    required this.elo,
    required this.gamename,
    required this.name,
    required this.percent,
    required this.played,
    required this.url,
    required this.won,
  });

  String elo;
  String gamename;
  String name;
  String percent;
  String played;
  String url;
  String won;

  factory UserApiModel.fromJson(Map<String, dynamic> json) => UserApiModel(
    elo: json["elo"],
    gamename: json["gamename"],
    name: json["name"],
    percent: json["percent"],
    played: json["played"],
    url: json["url"],
    won: json["won"],
  );

  Map<String, dynamic> toJson() => {
    "elo": elo,
    "gamename": gamename,
    "name": name,
    "percent": percent,
    "played": played,
    "url": url,
    "won": won,
  };
}
