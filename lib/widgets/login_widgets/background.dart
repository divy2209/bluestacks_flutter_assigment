import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 380,
          left: -150,
          child: Container(
            height: 480,
            width: 480,
            child: Image.asset('assets/hog.png'),
          ),
        ),
        Positioned(
          top: -180,
          left: -140,
          child: Container(
            width: 600,
            height: 600,
            child: Image.asset('assets/dragon.png'),
          ),
        ),
        Positioned(
          top: 720,
          right: 0,
          child: Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/pubg_drop.png'),
          ),
        ),
        Positioned(
          //bottom: 0,
          top: 352,
          right: -200,
          child: Container(
            height: 500,
            width: 500,
            child: Image.asset('assets/pubg.png'),
          ),
        ),
      ],
    );
  }
}
