import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> localDataSaving({required username, required password}) async {
  await GameTv.sharedPreferences!.setString(GameTv.username, username);
  await GameTv.sharedPreferences!.setString(GameTv.password, password);

  await GameTv.sharedPreferences!.setString(GameTv.userID, username);

  FirebaseFirestore.instance.collection('users').doc(username).get().then((snap) async {
    await GameTv.sharedPreferences!.setString(GameTv.name, snap.get(GameTv.name));
    await GameTv.sharedPreferences!.setString(GameTv.gameName, snap.get(GameTv.gameName));
    await GameTv.sharedPreferences!.setInt(GameTv.eloRating, snap.get(GameTv.eloRating));
    await GameTv.sharedPreferences!.setInt(GameTv.gamesPlayed, snap.get(GameTv.gamesPlayed));
    await GameTv.sharedPreferences!.setInt(GameTv.gamesWon, snap.get(GameTv.gamesWon));
    await GameTv.sharedPreferences!.setInt(GameTv.winPercent, snap.get(GameTv.winPercent));
  });
}