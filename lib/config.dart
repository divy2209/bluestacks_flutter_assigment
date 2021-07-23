import 'package:shared_preferences/shared_preferences.dart';

class GameTv {
  static SharedPreferences? sharedPreferences;

  static final String username = 'user';
  static final String password = 'pass';

  static final String userID = 'uid';
  static final String name = 'name';
  static final String gameName = 'game name';
  static final String eloRating = 'elo rating';
  static final String gamesPlayed = 'played';
  static final String gamesWon = 'won';
  static final String winPercent = 'win percent';
}