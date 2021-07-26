import 'package:bluestacks_flutter_assigment/services/local_data/config.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/game_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/user_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/loading.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:bluestacks_flutter_assigment/services/api_managers/user_api_manager.dart';
import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(snap.data!.gamename, style: TextStyle(color: Colors.black87, fontSize: 24),),
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Builder(
                  builder: (context) => IconButton(
                    icon: SvgPicture.asset('assets/drawer.svg'),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ),
            drawer: Container(
              width: size.width * 0.55,
              child: Drawer(
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.55,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.blueGrey),
                      child: DrawerHeader(child: Center(child: Text('Hello, ' + snap.data!.gamename, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),))),
                    ),
                    //Divider(height: 2,),
                    ListTile(
                      title: Text('Game profile'),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text('Friends'),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text('Requests'),
                      onTap: () => null,
                    ),
                    Divider(height: 5, color: Colors.blueGrey,),
                    ListTile(
                      title: Text('Upcoming tournaments'),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text('Previous tournaments'),
                      onTap: () => null,
                    ),
                    Divider(height: 5, color: Colors.blueGrey,),
                    ListTile(
                      title: Text('Logout'),
                      onTap: () async {
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
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    child: UserProfile(snap: snap),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 80,
                    child: GameProfile(snap: snap,),
                  ),
                  SizedBox(height: 20,),
                  Text('Recommended for you', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
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
