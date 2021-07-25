import 'package:bluestacks_flutter_assigment/config.dart';

Future<void> localDataSaving({required username, required password}) async {
  await GameTv.sharedPreferences!.setString(GameTv.username, username);
  await GameTv.sharedPreferences!.setString(GameTv.password, password);

  String url = 'https://game-tv-api.herokuapp.com/' + username;
  await GameTv.sharedPreferences!.setString(GameTv.userAPI, url);

}