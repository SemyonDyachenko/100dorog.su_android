import 'package:flutter/material.dart';
import 'package:travel/api/auth/auth_services.dart';
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/api/favorites/favorites.dart';
import 'package:travel/utils/CircularProgressBar.dart';

class FavoritesWidget extends StatefulWidget {
  _FavoritesWidget createState() => _FavoritesWidget();
}

class _FavoritesWidget extends State<FavoritesWidget> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  List<Map<String, dynamic>> favorites = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> tours = List<Map<String, dynamic>>();

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getStringFromSharedPrefs("user_id").then((id) {
      getFavorites(id.toString()).then((value) {
        if (value != "" &&
            value != null &&
            value != "error" &&
            value != "empty") {
          setState(() {
            favorites = value;
          });
        } else {}
      });

      getAllTours().then((value) {
        if (value != "" && value != null) {
          setState(() {
            tours = value;
          });
        } else {}
      });
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));

    getStringFromSharedPrefs("user_id").then((id) {
      getFavorites(id.toString()).then((value) {
        if (value != "" &&
            value != null &&
            value != "error" &&
            value != "empty") {
          setState(() {
            favorites = value;
          });
        } else {}
      });

      getAllTours().then((value) {
        if (value != "" && value != null) {
          setState(() {
            tours = value;
          });
        } else {}
      });
    });
  }

  Widget favoriteCard(
      BuildContext context,
      String id,
      String tour_id,
      String tour_name,
      String tour_date,
      String url_path,
      String price,
      String location) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.5,
              offset: Offset(0, 0),
              color: Colors.grey[400],
            ),
          ],
        ),
        width: m_ScreenSize.width * .9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    tour_name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 15),
                  child: FlatButton(
                    minWidth: 50,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      getStringFromSharedPrefs("user_id").then((id) {
                        removeFavorite(id.toString(), tour_id)
                            .then((value) async {
                          if (value == "success") {
                             if (favorites.length == 1) {
                            favorites.clear();
                          }
                            await refreshData();
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Тур удален из списка Избранное"),
                            ));
                          }
                        });
                      });
                    },
                    child: Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 15),
              child: Text(
                tour_date,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 0),
              width: m_ScreenSize.width * .9,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    location,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(400, 112, 128, 144),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    "Подробнее",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Text("Цена: " + price + " RUB"),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, bottom: 25),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url_path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return tours.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: Navigator.canPop(context)
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 22,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  : null,
              title: Text("Избранное",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
            body: RefreshIndicator(
              key: refreshKey,
              onRefresh: () async {
                await refreshData();
              },
              child: Builder(
                builder: (context) => SingleChildScrollView(
                    child: favorites.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var i = 0; i < favorites.length; i++)
                                favoriteCard(
                                    context,
                                    favorites[i]['id'],
                                    favorites[i]['tour_id'],
                                    tours[int.parse(favorites[i]['tour_id']) - 1]
                                        ['name'],
                                    tours[int.parse(favorites[i]['tour_id']) -
                                            1]['event_date']
                                        .toString(),
                                    tours[int.parse(favorites[i]['tour_id']) -
                                        1]['url_path'],
                                    tours[int.parse(favorites[i]['tour_id']) -
                                        1]['price'],
                                    tours[int.parse(favorites[i]['tour_id']) -
                                        1]['location']),
                              SizedBox(height: 20),
                            ],
                          )
                        : Column(
                            children: <Widget>[],
                          )),
              ),
            ),
          )
        : circularProgressBar();
  }
}
