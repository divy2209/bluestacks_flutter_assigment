import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:bluestacks_flutter_assigment/services/exports/home_imports.dart';
import 'package:flutter/material.dart';

class GameProfile extends StatelessWidget {
  final AsyncSnapshot<UserApiModel> snap;
  GameProfile({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.orange.shade300]
              )
            ),
            child: Column(
              children: [
                Text(snap.data != null ? snap.data!.played : '__', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text(AppLocalizations.of(context)!.matches, style: TextStyle(color: Colors.white, height: 1),),
                Text(AppLocalizations.of(context)!.played, style: TextStyle(color: Colors.white, height: 1),)
              ],
            ),
          ),
        ),
        SizedBox(width: 2,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.deepPurpleAccent.shade400, Colors.deepPurple.shade300]
              )
            ),
            child: Column(
              children: [
                Text(snap.data != null ? snap.data!.won : '__', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text(AppLocalizations.of(context)!.matches, style: TextStyle(color: Colors.white, height: 1),),
                Text(AppLocalizations.of(context)!.won, style: TextStyle(color: Colors.white, height: 1),)
              ],
            ),
          ),
        ),
        SizedBox(width: 2,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade300]
              )
            ),
            child: Column(
              children: [
                Text(snap.data != null ? (snap.data!.percent + '%') : '__%', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text(AppLocalizations.of(context)!.winning, style: TextStyle(color: Colors.white, height: 1),),
                Text(AppLocalizations.of(context)!.percent, style: TextStyle(color: Colors.white, height: 1),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
