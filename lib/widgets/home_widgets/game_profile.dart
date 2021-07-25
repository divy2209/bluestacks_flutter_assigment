import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:flutter/material.dart';

class GameProfile extends StatelessWidget {
  final AsyncSnapshot<UserApiModel> snap;
  GameProfile({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.orange.shade300]
              )
            ),
            child: Column(
              children: [
                Text(snap.data!.played, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text('Tournaments', style: TextStyle(color: Colors.white),),
                Text('played', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
        SizedBox(width: 2,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
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
                Text(snap.data!.won, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text('Tournaments', style: TextStyle(color: Colors.white),),
                Text('won', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
        SizedBox(width: 2,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade300]
              )
            ),
            child: Column(
              children: [
                Text(snap.data!.percent + "%", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
                Text('Winning', style: TextStyle(color: Colors.white),),
                Text('percentage', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
