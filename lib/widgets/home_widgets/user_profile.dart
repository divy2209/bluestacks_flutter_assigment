import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:bluestacks_flutter_assigment/services/exports/home_imports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserProfile extends StatelessWidget {
  final AsyncSnapshot<UserApiModel> snap;
  UserProfile({required this.snap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueGrey.withOpacity(0.8),
          radius: size.width * 0.13,
          child: ClipOval(
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress, color: Colors.black,),
              imageUrl: snap.data!.url,
              height: size.width * 0.26,
              width: 120,
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snap.data!.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(12),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(const Radius.circular(30))
                ),
                child: Row(
                  children: [
                    Text(snap.data!.elo, style: TextStyle(color: Colors.blueAccent, fontSize: 24, fontWeight: FontWeight.w500),),
                    SizedBox(width: size.width * 0.02,),
                    Text('Elo ' + AppLocalizations.of(context)!.rating, style: TextStyle(color: Colors.indigoAccent, fontSize: 16),)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
