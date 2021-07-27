// To parse this JSON data, do
//
//     final tournamentApiModel = tournamentApiModelFromJson(jsonString);

import 'dart:convert';

TournamentApiModel tournamentApiModelFromJson(String str) => TournamentApiModel.fromJson(json.decode(str));

String tournamentApiModelToJson(TournamentApiModel data) => json.encode(data.toJson());

class TournamentApiModel {
  TournamentApiModel({
    //this.code,
    this.data,
    //this.success,
  });

  //int? code;
  Data? data;
  //bool? success;

  factory TournamentApiModel.fromJson(Map<String, dynamic> json) => TournamentApiModel(
    //code: json["code"],
    data: Data.fromJson(json["data"]),
    //success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    //"code": code,
    "data": data!.toJson(),
    //"success": success,
  };
}

class Data {
  Data({
    required this.cursor,
    //required this.tournamentCount,
    required this.tournaments,
    //required this.isLastBatch,
  });

  String cursor;
  //dynamic tournamentCount;
  List<Tournament> tournaments;
  //bool isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cursor: json["cursor"],
    //tournamentCount: json["tournament_count"],
    tournaments: List<Tournament>.from(json["tournaments"].map((x) => Tournament.fromJson(x))),
    //isLastBatch: json["is_last_batch"],
  );

  Map<String, dynamic> toJson() => {
    "cursor": cursor,
    //"tournament_count": tournamentCount,
    "tournaments": List<dynamic>.from(tournaments.map((x) => x.toJson())),
    //"is_last_batch": isLastBatch,
  };
}

class Tournament {
  Tournament({
    /*required this.isCheckInRequired,
    required this.tournamentId,
    required this.tournamentEnded,
    required this.tournamentEndDate,
    required this.areRandomTeamsAllowed,
    required this.registeredTeams,
    required this.adminLocale,
    required this.regEndDate,
    required this.startDate,
    required this.rules,
    required this.maxTeams,
    required this.tournamentUrl,
    required this.prizes,
    required this.matchStyleType,
    required this.pwaUrl,
    required this.tournamentType,
    required this.geo,
    required this.maxLevelId,
    required this.isPasswordRequired,*/
    required this.name,
    /*required this.matchStyle,
    required this.registrationUrl,
    required this.gamePkg,
    required this.isRegistrationOpen,
    required this.isWaitlistEnabled,
    required this.incompleteTeamsAllowed,
    required this.isAutoResultAllowed,
    required this.teamSize,
    required this.status,
    required this.isLevelsEnabled,
    required this.indexPage,
    required this.dynamicAppUrl,
    required this.minLevelId,
    required this.gameFormat,
    required this.details,
    required this.gameIconUrl,
    required this.regStartDate,*/
    required this.coverUrl,
    /*required this.bracketsUrl,
    required this.tournamentSlug,
    required this.discordUrl,
    required this.gameId,
    required this.resultSubmissionByAdmin,
    required this.country,
    required this.adminUsername,*/
    required this.gameName,
    //required this.streamUrl,
  });

  /*bool isCheckInRequired;
  String tournamentId;
  bool tournamentEnded;
  String tournamentEndDate;
  bool areRandomTeamsAllowed;
  int registeredTeams;
  String adminLocale;
  String regEndDate;
  String startDate;
  String rules;
  int maxTeams;
  String tournamentUrl;
  String prizes;
  String matchStyleType;
  dynamic pwaUrl;
  String tournamentType;
  String geo;
  dynamic maxLevelId;
  bool isPasswordRequired;*/
  String name;
  /*String matchStyle;
  String registrationUrl;
  dynamic gamePkg;
  bool isRegistrationOpen;
  bool isWaitlistEnabled;
  bool incompleteTeamsAllowed;
  bool isAutoResultAllowed;
  int teamSize;
  String status;
  bool isLevelsEnabled;
  bool indexPage;
  String dynamicAppUrl;
  dynamic minLevelId;
  String gameFormat;
  String details;
  String gameIconUrl;
  String regStartDate;*/
  String coverUrl;
  /*dynamic bracketsUrl;
  String tournamentSlug;
  String discordUrl;
  String gameId;
  bool resultSubmissionByAdmin;
  String country;
  String adminUsername;*/
  String gameName;
  //String streamUrl;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
    /*isCheckInRequired: json["is_check_in_required"],
    tournamentId: json["tournament_id"],
    tournamentEnded: json["tournament_ended"],
    tournamentEndDate: json["tournament_end_date"],
    areRandomTeamsAllowed: json["are_random_teams_allowed"],
    registeredTeams: json["registered_teams"],
    adminLocale: json["admin_locale"],
    regEndDate: json["reg_end_date"],
    startDate: json["start_date"],
    rules: json["rules"],
    maxTeams: json["max_teams"],
    tournamentUrl: json["tournament_url"],
    prizes: json["prizes"],
    matchStyleType: json["match_style_type"],
    pwaUrl: json["pwa_url"],
    tournamentType: json["tournament_type"],
    geo: json["geo"],
    maxLevelId: json["max_level_id"],
    isPasswordRequired: json["is_password_required"],*/
    name: json["name"],
    /*matchStyle: json["match_style"],
    registrationUrl: json["registration_url"],
    gamePkg: json["game_pkg"],
    isRegistrationOpen: json["is_registration_open"],
    isWaitlistEnabled: json["is_waitlist_enabled"],
    incompleteTeamsAllowed: json["incomplete_teams_allowed"],
    isAutoResultAllowed: json["is_auto_result_allowed"],
    teamSize: json["team_size"],
    status: json["status"],
    isLevelsEnabled: json["is_levels_enabled"],
    indexPage: json["index_page"],
    dynamicAppUrl: json["dynamic_app_url"],
    minLevelId: json["min_level_id"],
    gameFormat: json["game_format"],
    details: json["details"],
    gameIconUrl: json["game_icon_url"],
    regStartDate: json["reg_start_date"],*/
    coverUrl: json["cover_url"],
    /*bracketsUrl: json["brackets_url"],
    tournamentSlug: json["tournament_slug"],
    discordUrl: json["discord_url"],
    gameId: json["game_id"],
    resultSubmissionByAdmin: json["result_submission_by_admin"],
    country: json["country"],
    adminUsername: json["admin_username"],*/
    gameName: json["game_name"],
    //streamUrl: json["stream_url"],
  );

  Map<String, dynamic> toJson() => {
    /*"is_check_in_required": isCheckInRequired,
    "tournament_id": tournamentId,
    "tournament_ended": tournamentEnded,
    "tournament_end_date": tournamentEndDate,
    "are_random_teams_allowed": areRandomTeamsAllowed,
    "registered_teams": registeredTeams,
    "admin_locale": adminLocale,
    "reg_end_date": regEndDate,
    "start_date": startDate,
    "rules": rules,
    "max_teams": maxTeams,
    "tournament_url": tournamentUrl,
    "prizes": prizes,
    "match_style_type": matchStyleType,
    "pwa_url": pwaUrl,
    "tournament_type": tournamentType,
    "geo": geo,
    "max_level_id": maxLevelId,
    "is_password_required": isPasswordRequired,*/
    "name": name,
    /*"match_style": matchStyle,
    "registration_url": registrationUrl,
    "game_pkg": gamePkg,
    "is_registration_open": isRegistrationOpen,
    "is_waitlist_enabled": isWaitlistEnabled,
    "incomplete_teams_allowed": incompleteTeamsAllowed,
    "is_auto_result_allowed": isAutoResultAllowed,
    "team_size": teamSize,
    "status": status,
    "is_levels_enabled": isLevelsEnabled,
    "index_page": indexPage,
    "dynamic_app_url": dynamicAppUrl,
    "min_level_id": minLevelId,
    "game_format": gameFormat,
    "details": details,
    "game_icon_url": gameIconUrl,
    "reg_start_date": regStartDate,*/
    "cover_url": coverUrl,
    /*"brackets_url": bracketsUrl,
    "tournament_slug": tournamentSlug,
    "discord_url": discordUrl,
    "game_id": gameId,
    "result_submission_by_admin": resultSubmissionByAdmin,
    "country": country,
    "admin_username": adminUsername,*/
    "game_name": gameName,
    //"stream_url": streamUrl,
  };
}