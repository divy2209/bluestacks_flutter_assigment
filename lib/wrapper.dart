import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

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
