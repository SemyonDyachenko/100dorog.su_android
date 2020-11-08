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
              height: MediaQuery.of(context).size.height * .36, // .35
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
                      alignment: Alignment.topCenter,
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

    List<int> text = [1, 2, 3, 4];

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
                      Column(
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
                                          margin:
                                              EdgeInsets.only(left: 0, top: 5),
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
                    ],
                  ),
                ],
              ),
            ));
          });
        });
  }

  String weekdayToString(int day) {
    if (day > 7) {
      return "Error: more seven days";
    } else {
      switch (day) {
        case 1:
          return "Понедельник";
          break;
        case 2:
          return "Вторник";
          break;
        case 3:
          return "Среда";
          break;
        case 4:
          return "Четверг";
          break;
        case 5:
          return "Пятница";
          break;
        case 6:
          return "Суббота";
          break;
        case 7:
          return "Воскресенье";
          break;
      }
    }

    return "none";
  }

  String monthToString(int month) {
    if (month > 12) {
      return "Error: more then 12 month!";
    } else if (month <= 0) {
      return "Error: smaller then 1 month!";
    } else {
      switch (month) {
        case 1:
          return "Января";
          break;
        case 2:
          return "Февраля";
          break;
        case 3:
          return "Марта";
          break;
        case 4:
          return "Апреля";
          break;
        case 5:
          return "Мая";
          break;
        case 6:
          return "Июня";
          break;
        case 7:
          return "Июля";
          break;
        case 8:
          return "Августа";
          break;
        case 9:
          return "Сентября";
          break;
        case 10:
          return "Октября";
          break;
        case 11:
          return "Ноября";
          break;
        case 12:
          return "Декабря";
          break;
      }
    }

    return "none";
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;
    DateTime _dateTime;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: m_ScreenSize.width,
              height: m_ScreenSize.height * .915,
              decoration:
                  BoxDecoration(color: Color.fromARGB(500, 22, 141, 207)),
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
                            height: m_ScreenSize.height * .066,
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
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            bottom: 0),
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
                            height: m_ScreenSize.height * .066,
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
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: _dateTime == null
                                                  ? DateTime.now()
                                                  : _dateTime,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2021),
                                            ).then((date) {
                                              setState(() {
                                                _dateTime = date;
                                              });
                                            });
                                          },
                                          child: Text(
                                            "30 Октября, Птяница",
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
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            bottom: 0),
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
                            height: m_ScreenSize.height * .066,
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
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            bottom: 0),
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
      ),
    );
  }
}
