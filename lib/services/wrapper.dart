import 'package:bluestacks_flutter_assigment/services/home_provider.dart';
import 'package:bluestacks_flutter_assigment/services/local_data/config.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(GameTv.sharedPreferences!.getString(GameTv.username) != null && GameTv.sharedPreferences!.getString(GameTv.password) != null){
      return Home();
    } else {
      return Login();
    }
  }
}
