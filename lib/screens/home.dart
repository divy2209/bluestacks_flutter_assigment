import 'dart:ui';

import 'package:bluestacks_flutter_assigment/services/exports/home_imports.dart';


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
                    Divider(height: 5, color: Colors.blueGrey,),
                    ListTile(
                      title: Text('Upcoming tournaments'),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text('Previous tournaments'),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text('Invites'),
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
                    child: user.data != null ? UserProfile(snap: user) : Center(child: SpinKitCircle(color: Colors.black,),),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 80,
                    child: GameProfile(snap: user),
                  ),
                  SizedBox(height: 20,),
                  Text('Recommended for you', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  TournamentListView(),
                ],
              ),
            ),
          );
      },
    );
  }
}
