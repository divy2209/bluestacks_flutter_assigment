import 'package:bluestacks_flutter_assigment/services/exports/home_imports.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TournamentListView extends StatefulWidget {

  @override
  _TournamentListViewState createState() => _TournamentListViewState();
}

class _TournamentListViewState extends State<TournamentListView> {

  String pageCursor = '';
  bool isLastPage = false;
  List<Tournament> tournament = [];
  final RefreshController scrollController = RefreshController(initialRefresh: false);

  Future<bool> getTournamentDetails() async {
    if(isLastPage) {
      scrollController.loadNoData();
    }
    String tournamentApi = 'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all';
    if(pageCursor != '') {
      tournamentApi = '$tournamentApi&cursor=$pageCursor';
    }
    final response = await http.get(
        Uri.parse(tournamentApi),
        headers: {"Accept": "application/json"}
    );
    if(response.statusCode == 200){
      final result = tournamentApiModelFromJson(response.body);

      tournament.addAll(result.data!.tournaments);
      pageCursor = result.data!.cursor;
      isLastPage = result.data!.isLastBatch;
      setState(() {

      });

      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTournamentDetails();
  }

  @override
  Widget build(BuildContext context) {

    if(tournament.length != 0) {
      return Expanded(
        child: SmartRefresher(
          controller: scrollController,
          enablePullUp: true,
          enablePullDown: false,
          onLoading: () async {
            final result = await getTournamentDetails();
            if(result) {
              scrollController.loadComplete();
            } else {
              scrollController.loadFailed();
            }
          },
          child: ListView.separated(
            itemCount: tournament.length,
            itemBuilder: (context, index) {
              final game = tournament[index];
              return Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: game.coverUrl,
                      progressIndicatorBuilder: (context, url,
                          downloadProgress) =>
                          CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: Colors.black,),
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            width: 352.7,
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
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
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
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
                                Text(game.name.trim(), style: TextStyle(
                                    fontWeight: FontWeight.w600, height: 1.0, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,),
                                Text(game.gameName,
                                  style: TextStyle(color: Colors.blue.shade600, fontSize: 14),)
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
            return Divider(height: 10, color: Colors.transparent,);
          },
          ),
        ),
      );
    } else {
      return Container(child: Center(child: SpinKitCircle(color: Colors.black,)));
    }
  }
}
