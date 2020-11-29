import 'package:flutter/material.dart';
import 'package:travel/Components/SearchPage.dart';
import 'package:travel/utils/CircularProgressBar.dart';
import '../api/auth/auth_services.dart';
import 'Widgets/TourWidget.dart';

class MainPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MainPage(),
      );
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  GlobalKey<RefreshIndicatorState> refreshKey;

  ScrollController _scrollController = new ScrollController();
  List<Map<String, dynamic>> allTours = List<Map<String, dynamic>>();
  List needCount = [0, 1, 2];

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

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getAllTours().then((value) {
      setState(() {
        allTours = value;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget mainTourCard(BuildContext context, int product_id, String name,
      String url, String price) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TourWidget(id: product_id);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0, bottom: 15),
        width: m_ScreenSize.width * .90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: m_ScreenSize.width * .90,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: m_ScreenSize.width * .90,
              height: 105,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 15, left: 10),
                          child: Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            "Россия, Крым",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "07.11.2020 в 5:00",
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(
                            top: 15,
                            right: 10,
                          ),
                          child: Text(
                            price + " RUB/",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(
                            top: 5,
                            right: 10,
                          ),
                          child: Text(
                            "Взрослый",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(
                            top: 10,
                            right: 10,
                          ),
                          child: Text(
                            "Подробнее",
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          )),
                    ],
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
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;
    List text = [1, 2, 3, 4];

    return allTours.isNotEmpty
        ? Scaffold(
            body: RefreshIndicator(
                key: refreshKey,
                onRefresh: () async {
                  await refreshData();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: m_ScreenSize.width,
                        height: m_ScreenSize.height * .35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/mainpagepicture.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: m_ScreenSize.height * .15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Text("Вы сейчас в Абинске",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text("Выберите подходящий тур",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Transform.translate(
                                    offset: const Offset(0.0, 25.0),
                                    child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SearchPage();
                                        }));
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        width: m_ScreenSize.width * .85,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 8.0,
                                              spreadRadius: 2.0,
                                              offset: Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: FocusScope(
                                          node: new FocusScopeNode(),
                                          child: TextField(
                                            enabled: false,
                                            focusNode: FocusNode(),
                                            enableInteractiveSelection: false,
                                            keyboardType: TextInputType.phone,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 14.0),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ),
                                              hintText:
                                                  "Куда вы хотите поехать ? ",
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: (m_ScreenSize.width -
                                        (m_ScreenSize.width * .90)) /
                                    2,
                                top: 25,
                                right: (m_ScreenSize.width -
                                        (m_ScreenSize.width * .90)) /
                                    2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Популярные туры",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Смотреть все",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        for (var i in text)
                                          FlatButton(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            minWidth: m_ScreenSize.width / 3,
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return TourWidget(
                                                    id: int.parse(
                                                        allTours[i]['id']));
                                              }));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0, right: 15),
                                                  width: 150,
                                                  height: 155,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          allTours[i]
                                                              ['url_path']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 0),
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    allTours[i]['name'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5, bottom: 10),
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(Icons.location_on,
                                                          color: Colors.blue),
                                                      Text(
                                                        allTours[i]['location'],
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: (m_ScreenSize.width -
                                        (m_ScreenSize.width * .90)) /
                                    2,
                                top: 25,
                                right: (m_ScreenSize.width -
                                        (m_ScreenSize.width * .90)) /
                                    2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Новые туры",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Смотреть все",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        for (var i in text)
                                          FlatButton(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            minWidth: m_ScreenSize.width / 3,
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return TourWidget(
                                                    id: int.parse(
                                                        allTours[i]['id']));
                                              }));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0, right: 15),
                                                  width: 150,
                                                  height: 155,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          allTours[i]
                                                              ['url_path']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 0),
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    allTours[i]['name'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5, bottom: 10),
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(Icons.location_on,
                                                          color: Colors.blue),
                                                      Text(
                                                        allTours[i]['location'],
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: (m_ScreenSize.width -
                                          (m_ScreenSize.width * .90)) /
                                      2,
                                  top: 0),
                              child: Container(
                                child: Text(
                                  "Туры для вас",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        for (var i in text)
                                          FlatButton(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            minWidth: m_ScreenSize.width / 3,
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            onPressed: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 15),
                                              width: 200,
                                              height: 280,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://static.tildacdn.com/tild3031-3133-4934-a363-626433333835/WhatsApp_Image_2020-.jpeg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 5),
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Релакс-день",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 10),
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "1600 RUB",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: (m_ScreenSize.width -
                                          (m_ScreenSize.width * .90)) /
                                      2,
                                  top: 0,
                                  bottom: 20),
                              child: Container(
                                child: Text(
                                  "Новые туры",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                for (var i in needCount)
                                  mainTourCard(
                                      context,
                                      int.parse(allTours[i]['id']),
                                      allTours[i]['name'],
                                      allTours[i]['url_path'],
                                      allTours[i]['price']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          )
        : circularProgressBar();
  }
}
