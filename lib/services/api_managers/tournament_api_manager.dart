import 'dart:convert';

import 'package:bluestacks_flutter_assigment/services/api_models/tournament_api_model.dart';
import 'package:http/http.dart' as http;

class TournamentApiManager {
  Future<TournamentApiModel> getTournamentDetails() async {
    final response = await http.get(
        Uri.parse("http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=100&status=all"),
        headers: {"Accept": "application/json"}
    );
    if(response.statusCode == 200){
      return TournamentApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load tournament details');
    }
  }
}