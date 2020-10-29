import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  _SearchPage createState() => _SearchPage();
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SearchPage(),
      );
}

class _SearchPage extends State<SearchPage> {
  void _openPassangerSelect(context) {
    var _oldPassengerCount = 1;
    var _childPassengerCount = 0;
    var _allPassengerCount = _oldPassengerCount + _childPassengerCount;

    void _updatePassengerCount() {
      _allPassengerCount = _oldPassengerCount + _childPassengerCount;
    }

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
              height: MediaQuery.of(context).size.height * .35,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      width: 50.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(500, 210, 210, 210),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Пассажиры",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(200, 225, 225, 225)
                                .withOpacity(0.5),
                            spreadRadius: 0.1,
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Взрослые",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    "Больше 14 лет",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0,
                                  right:
                                      MediaQuery.of(context).size.width * .1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (_oldPassengerCount >= 2) {
                                          // 2 becouse one old it's minimum count, can not child without old passenger
                                          _oldPassengerCount--;
                                          _updatePassengerCount();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    _oldPassengerCount.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (_oldPassengerCount < 5) {
                                          _oldPassengerCount++;
                                          _updatePassengerCount();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Дети",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    "От 0 до 14 лет",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0,
                                  right:
                                      MediaQuery.of(context).size.width * .1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (_childPassengerCount >= 1) {
                                          // 1 becouse one old it's minimum count, can not child without old passenger
                                          _childPassengerCount--;
                                          _updatePassengerCount();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    _childPassengerCount.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (_childPassengerCount < 5) {
                                          // 2 becouse one old it's minimum count, can not child without old passenger
                                          _childPassengerCount++;
                                          _updatePassengerCount();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: FlatButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Применить",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void _openPlaceSelect(context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
                child: new Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topCenter,
                    width: 50.0,
                    height: 6.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(500, 210, 210, 210),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Маршрут",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(200, 225, 225, 225)
                              .withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: m_ScreenSize.width,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "МАРШРУТЫ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (var i in text)
                              Container(
                                width: m_ScreenSize.width,
                                margin: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 0.3,
                                    ),
                                  ),
                                ),
                                height: 65,
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: m_ScreenSize.width,
                                            margin: EdgeInsets.only(
                                                left: 0, top: 20, right: 0),
                                            child: Text(
                                              "Краснодар",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 0, top: 5),
                                            child: Text(
                                              "Краснодар, Краснодарский Край, Россия",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                      ),
                    ],
                  ),
                ],
              ),
            ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: m_ScreenSize.width,
            height: m_ScreenSize.height * .915,
            decoration: BoxDecoration(color: Color.fromARGB(500, 22, 141, 207)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: m_ScreenSize.height * .10,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: m_ScreenSize.width,
                    child: Text(
                      "Поиск подходящего тура",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: m_ScreenSize.height * .15,
                  ),
                  child: Container(
                    width: m_ScreenSize.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: m_ScreenSize.width * .95,
                          height: m_ScreenSize.height * .065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 0,
                                          right: 0,
                                          bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {
                                          _openPlaceSelect(context);
                                        },
                                        child: Text(
                                          'Куда, RU',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 0, right: 0, bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {},
                                        child: Icon(Icons.location_on_sharp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: m_ScreenSize.width * .95,
                          height: m_ScreenSize.height * .065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 0,
                                          right: 0,
                                          bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {},
                                        child: Text(
                                          (DateTime.now().day).toString() +
                                              ' Октября, Понедельник',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 0, right: 0, bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {},
                                        child: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: m_ScreenSize.width * .95,
                          height: m_ScreenSize.height * .065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 0,
                                          right: 0,
                                          bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {
                                          _openPassangerSelect(context);
                                        },
                                        child: Text(
                                          '1 Пассажир, Возрослый',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 0, right: 0, bottom: 0),
                                      child: FlatButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onPressed: () {},
                                        child: Icon(Icons.people_alt),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: m_ScreenSize.width * .95,
                          height: m_ScreenSize.height * .08,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 43, 227, 107),
                              borderRadius: BorderRadius.circular(100)),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Найти",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
    );
  }
}
