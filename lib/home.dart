import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:bluestacks_flutter_assigment/loading.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(GameTv.sharedPreferences!.getString(GameTv.gameName).toString(), style: TextStyle(color: Colors.black87),),
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.doorOpen, color: Colors.black87),
            onPressed: () async {
              setState(() {
                loading = true;
              });
              await GameTv.sharedPreferences!.clear();
              Future.delayed(const Duration(milliseconds: 500), (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp())
                );
              });
            },
          )
        ],
      ),
    );
  }
}
