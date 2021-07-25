import 'dart:convert';

import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:bluestacks_flutter_assigment/user_api_model.dart';
import 'package:http/http.dart' as http;

class UserApiManager {
  Future<UserApiModel> getUserDetails() async {
    //print(GameTv.sharedPreferences!.getString(GameTv.userAPI).toString());
    final response = await http.get(
        Uri.parse(GameTv.sharedPreferences!.getString(GameTv.userAPI).toString()),
        headers: {"Accept": "application/json"}
    );
    if(response.statusCode == 200) {
      return UserApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user details');
    }
  }
}