import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api/auth/preferences.dart';
import '../api/auth/auth_services.dart';
import 'Widgets/TourWidget.dart';

class MainPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MainPage(),
      );
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  ScrollController _scrollController = new ScrollController();

  List<Map<String, dynamic>> allTours;
  List needCount = [0, 1, 2];

  @override
  void initState() {
    super.initState();

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
        constraints: BoxConstraints.tightFor(height: 270),
        margin: EdgeInsets.only(left: 0, right: 0, bottom: 15),
        width: m_ScreenSize.width * .90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: m_ScreenSize.width * .90,
              height: 165,
              decoration: BoxDecoration(
                color: Colors.red,
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

    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: m_ScreenSize.height * .20,
                      width: m_ScreenSize.width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(500, 234, 234, 234)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                              height: (m_ScreenSize.height * .30) * .22,
                              width: m_ScreenSize.width * .90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: 0,
                                          right: 0,
                                          bottom: 0),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Куда вы, RU',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: (m_ScreenSize.width -
                                            (m_ScreenSize.width * .90)) /
                                        2,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: m_ScreenSize.width * .30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Выбор даты',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: (m_ScreenSize.width * .30) +
                                        ((m_ScreenSize.width -
                                                    (m_ScreenSize.width *
                                                        .90)) /
                                                2) *
                                            1.5,
                                  ),
                                  child: Container(
                                    height: 35,
                                    width: m_ScreenSize.width * .30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Пассажиры',
                                        style: TextStyle(fontSize: 14),
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
                            top: 25),
                        child: Container(
                          child: Text(
                            "Популярные туры",
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
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {},
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 15),
                                        width: 160,
                                        height: 165,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://static.tildacdn.com/tild6330-3661-4466-a132-663932353937/j8NgysiE04c.jpg'),
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
                                                  left: 10, bottom: 0),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Орлиная полка",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, bottom: 10),
                                              alignment: Alignment.bottomLeft,
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
                            top: 0),
                        child: Container(
                          child: Text(
                            "Популярные туры",
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
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {},
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 15),
                                        width: 160,
                                        height: 165,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://static.tildacdn.com/tild3335-3636-4838-b062-356132383730/2951045.jpg'),
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
                                                  left: 10, bottom: 0),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Крым",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, bottom: 10),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "5500 RUB",
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
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {},
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 15),
                                        width: 210,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
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
                                              alignment: Alignment.bottomLeft,
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
                                              alignment: Alignment.bottomLeft,
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
          ),
        );
      }),
    );
  }
}
