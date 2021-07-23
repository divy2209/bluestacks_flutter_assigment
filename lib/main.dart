import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:bluestacks_flutter_assigment/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GameTv.sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'game.tv',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
