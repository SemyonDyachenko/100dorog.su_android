import 'package:flutter/material.dart';
import 'package:travel/api/auth/auth_services.dart';

import 'Widgets/TourWidget.dart';

class SearchPage extends StatefulWidget {
  _SearchPage createState() => _SearchPage();
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SearchPage(),
      );
}

class _SearchPage extends State<SearchPage> {
  List<Map<String, dynamic>> allTours = List<Map<String, dynamic>>();
  GlobalKey<RefreshIndicatorState> refreshKey;
  List text = [0, 1, 2, 3, 4, 5, 6];

  Widget tourCard(
      BuildContext context,
      int product_id,
      String name,
      String date,
      String url_path,
      String price,
      String location,
      String promotion) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Container(
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TourWidget(id: product_id);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            promotion == "1"
                ? ClipRect(
                    child: Banner(
                      message: "Акция",
                      location: BannerLocation.topEnd,
                      color: Colors.red[400],
                      child: Container(
                        height: m_ScreenSize.height / 3.2,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: NetworkImage(url_path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: m_ScreenSize.height / 3.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: NetworkImage(url_path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 0, left: 0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.blue),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAllTours().then((value) {
      setState(() {
        allTours = value;
      });
    });
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getAllTours().then((value) {
      setState(() {
        allTours = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;
    DateTime _dateTime;
    var width = m_ScreenSize.width;
    var height = m_ScreenSize.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await refreshData();
        },
        key: refreshKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  alignment: Alignment.centerLeft,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 6.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Введите запрос",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Все туры",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: width / height,
                    children: <Widget>[
                      for (var i = 0; i < allTours.length; i++)
                        if (allTours.length > 0 &&
                            int.parse(allTours[i]['purchased_seats']) <
                                int.parse(allTours[i]['seats_count']))
                          tourCard(
                            context,
                            int.parse(allTours[i]['id']),
                            allTours[i]['name'],
                            allTours[i]['event_date'].toString(),
                            allTours[i]['url_path'].toString(),
                            allTours[i]['price'].toString(),
                            allTours[i]['location'].toString(),
                            allTours[i]['promotion'].toString(),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
