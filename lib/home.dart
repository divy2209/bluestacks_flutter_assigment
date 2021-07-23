import 'package:bluestacks_flutter_assigment/config.dart';
import 'package:bluestacks_flutter_assigment/login.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Text('wolf')),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.doorOpen, color: Colors.black87),
            onPressed: () async {
              await GameTv.sharedPreferences!.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          )
        ],
      ),
    );
  }
}
