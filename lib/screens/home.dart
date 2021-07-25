import 'package:bluestacks_flutter_assigment/services/local_data/config.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/game_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/user_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/loading.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:bluestacks_flutter_assigment/services/api_managers/user_api_manager.dart';
import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  late Future<UserApiModel> _userApiModel;
  @override
  void initState() {
    _userApiModel = UserApiManager().getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<UserApiModel>(
      future: _userApiModel,
      builder: (context, snap) {
        if (snap.hasData) {
          return loading ? Loading() : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(snap.data!.gamename, style: TextStyle(color: Colors.black87, fontSize: 24),),
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
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: UserProfile(snap: snap),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 80,
                    child: GameProfile(snap: snap,),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: CircularProgressIndicator(),
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
      },
    );
  }
}
