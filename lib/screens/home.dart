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
    final provider = Provider.of<LocaleProvider>(context, listen: false);
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
                          child: user.data != null ? Text(AppLocalizations.of(context)!.greet + ' ' + user.data!.gamename, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),) : SpinKitThreeBounce(color: Colors.black, size: 15),
                        ),
                      ),
                    ),
                    //Divider(height: 2,),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.gameprofile),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.friends),
                      onTap: () => null,
                    ),
                    Divider(height: 5, color: Colors.blueGrey,),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.upcoming),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.previous),
                      onTap: () => null,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.invites),
                      onTap: () => null,
                    ),
                    Divider(height: 5, color: Colors.blueGrey,),
                    ExpansionTile(
                      title: Text(AppLocalizations.of(context)!.language),
                      children: [
                        ListTile(
                          title: Text('English', style: TextStyle(fontWeight: FontWeight.w300),),
                          onTap: (){
                            provider.setLocale(L10n.all[0]);
                          },
                        ),
                        ListTile(
                          title: Text('日本', style: TextStyle(fontWeight: FontWeight.w300),),
                          onTap: (){
                            provider.setLocale(L10n.all[1]);
                          },
                        )
                      ],
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.logout),
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
                    height: 90,
                    child: GameProfile(snap: user),
                  ),
                  SizedBox(height: 20,),
                  Text(AppLocalizations.of(context)!.recommendation, style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
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
