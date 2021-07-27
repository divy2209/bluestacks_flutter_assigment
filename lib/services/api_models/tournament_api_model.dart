// To parse this JSON data, do
//
//     final tournamentApiModel = tournamentApiModelFromJson(jsonString);

import 'dart:convert';

TournamentApiModel tournamentApiModelFromJson(String str) => TournamentApiModel.fromJson(json.decode(str));

String tournamentApiModelToJson(TournamentApiModel data) => json.encode(data.toJson());

class TournamentApiModel {
  TournamentApiModel({
    this.data,
  });

  Data? data;

  factory TournamentApiModel.fromJson(Map<String, dynamic> json) => TournamentApiModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    required this.cursor,
    required this.tournaments,
    required this.isLastBatch,
  });

  String cursor;
  List<Tournament> tournaments;
  bool isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cursor: json["cursor"],
    tournaments: List<Tournament>.from(json["tournaments"].map((x) => Tournament.fromJson(x))),
    isLastBatch: json["is_last_batch"],
  );

  Map<String, dynamic> toJson() => {
    "cursor": cursor,
    "tournaments": List<dynamic>.from(tournaments.map((x) => x.toJson())),
    "is_last_batch": isLastBatch,
  };
}

class Tournament {
  Tournament({
    required this.name,
    required this.coverUrl,
    required this.gameName,
  });

  String name;
  String coverUrl;
  String gameName;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
    name: json["name"],
    coverUrl: json["cover_url"],
    gameName: json["game_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cover_url": coverUrl,
    "game_name": gameName,
  };
}