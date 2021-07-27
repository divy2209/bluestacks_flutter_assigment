import 'dart:ui';

import 'package:bluestacks_flutter_assigment/services/api_managers/tournament_api_manager.dart';
import 'package:bluestacks_flutter_assigment/services/api_models/tournament_api_model.dart';
import 'package:bluestacks_flutter_assigment/services/local_data/config.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/game_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/home_widgets/user_profile.dart';
import 'package:bluestacks_flutter_assigment/widgets/loading.dart';
import 'package:bluestacks_flutter_assigment/main.dart';
import 'package:bluestacks_flutter_assigment/services/api_managers/user_api_manager.dart';
import 'package:bluestacks_flutter_assigment/services/api_models/user_api_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  bool isLoading = false;


  late Future<UserApiModel> _userApiModel;
  late Future<TournamentApiModel> _tournamentApiModel;

  @override
  void initState() {
    _userApiModel = UserApiManager().getUserDetails();
    _tournamentApiModel = TournamentApiManager().getTournamentDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<UserApiModel>(
      future: _userApiModel,
      builder: (context, user) {
        return loading ? Loading() : Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade50,
              elevation: 0,
              centerTitle: true,
              title: Text(user.data != null ? user.data!.gamename : '', style: TextStyle(color: Colors.black87, fontSize: 24),),
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
                      child: DrawerHeader(
                        child: Center(
                          child: user.data != null ? Text('Hello, ' + user.data!.gamename, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),) : SpinKitThreeBounce(color: Colors.black, size: 15),
                        ),
                      ),
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
                    child: UserProfile(snap: user),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 80,
                    child: GameProfile(snap: user),
                  ),
                  SizedBox(height: 20,),
                  Text('Recommended for you', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  FutureBuilder<TournamentApiModel>(
                    future: _tournamentApiModel,
                    builder: (context, tournament){
                      if(tournament.hasData){
                        return Expanded(
                          child: ListView.separated(
                            itemCount: tournament.data!.data!.tournaments.length,
                            itemBuilder: (context, index) {
                              var game = tournament.data!.data!.tournaments[index];
                              return Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: game.coverUrl,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress, color: Colors.black,),
                                      imageBuilder: (context, imageProvider) => Container(
                                        width: 352.7,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            image: imageProvider, fit: BoxFit.cover
                                          )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      width: 352.7,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400.withOpacity(0.4),
                                            blurRadius: 5,
                                          )
                                        ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(game.name.trim(), style: TextStyle(fontWeight: FontWeight.w600, height: 1.0), overflow: TextOverflow.ellipsis,),
                                                Text(game.gameName, style: TextStyle(color: Colors.blue.shade600),)
                                              ],
                                            ),
                                          ),
                                          Icon(Icons.chevron_right, size: 25)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                              return Divider(height: 10,color: Colors.transparent,);
                            },
                          ),
                        );
                      } else {
                        return Container(child: Center(child: SpinKitCircle(color: Colors.black,)));
                      }
                    },
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}
