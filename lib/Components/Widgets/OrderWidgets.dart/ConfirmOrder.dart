import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PrivacyWidget.dart';

class ConfirmOrder extends StatefulWidget {
  _ConfirmOrder createState() => _ConfirmOrder();
}

class _ConfirmOrder extends State<ConfirmOrder> {
  var _passengerCount = 1;
  var _childCount = 0;
  var _allCount = 1;

  var normalPrice = 4800;
  var childPrice = 2400;

  var _applyCoins = false;

  void _passenger(bool plus) {
    setState(() {
      if (plus) {
        _passengerCount++;
      } else {
        _passengerCount--;
      }
      _allUpdate();
    });
  }

  void _child(bool plus) {
    setState(() {
      if (plus) {
        _childCount++;
      } else {
        _childCount--;
      }
      _allUpdate();
    });
  }

  void _allUpdate() {
    setState(() {
      _allCount = _passengerCount + _childCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
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
        title: Text("Подтверждение",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 100),
                      child: Text(
                        "Дворцовое ожерелье Крыма",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "Россия, Крымский п-ов",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * .90,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.people_alt_outlined, size: 22),
                          SizedBox(width: 5),
                          Text(
                            "Укажите пассажиров",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
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
                                    "Взрослые",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
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
                                      if (_passengerCount > 1) {
                                        _passenger(false);
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                      color: Colors.blue[100],
                                    ),
                                  ),
                                  Text(
                                    _passengerCount.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      if (_passengerCount < 5) {
                                        _passenger(true);
                                      }
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                      color: Colors.blue[100],
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
                                      fontWeight: FontWeight.normal,
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
                                      if (_childCount > 0) {
                                        _child(false);
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                      color: Colors.blue[100],
                                    ),
                                  ),
                                  Text(
                                    _childCount.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  FlatButton(
                                    minWidth: 10,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      if (_childCount < 5) {
                                        _child(true);
                                      }
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 30,
                                      color: Colors.blue[100],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * .90,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.date_range_outlined),
                              SizedBox(width: 5),
                              Text(
                                "18.11.2020 в 6:00",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.people_alt_outlined),
                              SizedBox(width: 5),
                              Text(
                                "2 Пассажира",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * .90,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Итого (RUB)",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            ((_childCount * childPrice) +
                                        (_passengerCount * normalPrice))
                                    .toString() +
                                " ₽",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            normalPrice.toString() +
                                " x " +
                                _passengerCount.toString() +
                                " (Взрослых)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            (_passengerCount * normalPrice).toString() + " ₽",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            childPrice.toString() +
                                " x " +
                                _childCount.toString() +
                                " (Детей)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            (_childCount * childPrice).toString() + " ₽",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 5, right: 20),
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: _applyCoins,
                              checkColor: Colors.black,
                              activeColor: Colors.grey[200],
                              hoverColor: Colors.grey[200],
                              onChanged: (value) {
                                setState(() {
                                  _applyCoins = value;
                                });
                              },
                            ),
                          ),
                          Text("Списать доступные бонусы ? ",
                              style: TextStyle(fontSize: 16)),
                          Text("500",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(color: Colors.transparent)),
                        minWidth: m_ScreenSize.width * .95,
                        height: 60,
                        color: Color.fromARGB(500, 0, 140, 255),
                        onPressed: () {},
                        child: Text("Подтвердить",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
