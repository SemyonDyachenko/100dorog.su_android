import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MainPage(),
      );

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: m_ScreenSize.height * .30,
                width: m_ScreenSize.width,
                decoration:
                    BoxDecoration(color: Color.fromARGB(500, 22, 141, 207)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        height: (m_ScreenSize.height * .30) * .45,
                        width: m_ScreenSize.width * .90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 0, right: 0, bottom: 0),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Откуда, RU',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, top: 0, right: 15, bottom: 0),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'ANSK',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Container(
                                width: m_ScreenSize.width,
                                height: 2,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(200, 212, 212, 212)),
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 0, right: 0, bottom: 0),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Куда, RU',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, top: 0, right: 15, bottom: 0),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'DTH',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        textAlign: TextAlign.left,
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
                                borderRadius: BorderRadius.circular(6),
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
                                              (m_ScreenSize.width * .90)) /
                                          2) *
                                      1.5,
                            ),
                            child: Container(
                              height: 35,
                              width: m_ScreenSize.width * .30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
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
                      left:
                          (m_ScreenSize.width - (m_ScreenSize.width * .90)) / 2,
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
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 0, right: 7),
                              width: m_ScreenSize.width / 3,
                              height: 142,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: AssetImage("assets/Istanbul.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7, right: 7),
                              width: m_ScreenSize.width / 3,
                              height: 142,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: AssetImage("assets/Istanbul.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7, right: 7),
                              width: m_ScreenSize.width / 3,
                              height: 142,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: AssetImage("assets/Istanbul.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7, right: 7),
                              width: m_ScreenSize.width / 3,
                              height: 142,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: AssetImage("assets/Istanbul.jpg"),
                                  fit: BoxFit.cover,
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left:
                          (m_ScreenSize.width - (m_ScreenSize.width * .90)) / 2,
                      top: 0),
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
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 7),
                        width: m_ScreenSize.width / 3,
                        height: 142,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage("assets/ab.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7, right: 7),
                        width: m_ScreenSize.width / 3,
                        height: 142,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage("assets/ab.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7, right: 7),
                        width: m_ScreenSize.width / 3,
                        height: 142,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage("assets/ab.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7, right: 7),
                        width: m_ScreenSize.width / 3,
                        height: 142,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage("assets/ab.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
