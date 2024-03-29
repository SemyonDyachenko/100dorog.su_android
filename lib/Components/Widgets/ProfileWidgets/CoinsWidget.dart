import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'AboutCoinsWidget.dart';
import '../../../api/auth/auth_services.dart';

class CoinsWidget extends StatefulWidget {
  _CoinsWidget createState() => _CoinsWidget();
}

class _CoinsWidget extends State<CoinsWidget> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  var _coinsCount = "0";
  var _coinsText;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getStringFromSharedPrefs("user_email").then((phone) {
      if (phone != null) {
        getCoins(phone).then((result) {
          getStringFromSharedPrefs("coins").then((coins) {
            if (coins == "" || coins == null) {
              setState(() {
                addStringValueToSharedPrefs("coins", result);
                _coinsCount = result;
                if (int.parse(_coinsCount) > 0) {
                  _coinsText = "У вас есть доступны бонусы 100 DOROG";
                } else {
                  _coinsText = "У вас еще нет бонусов 100 DOROG";
                }
              });
            } else {
              setState(() {
                _coinsCount = result;
                if (int.parse(_coinsCount) > 0) {
                  _coinsText = "У вас есть доступны бонусы 100 DOROG";
                } else {
                  _coinsText = "У вас еще нет бонусов 100 DOROG";
                }

                if (result == coins) {
                } else {
                  addStringValueToSharedPrefs("coins", result);
                }
              });
            }
          });
        });
      }
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getStringFromSharedPrefs("user_email").then((phone) {
      if (phone != null) {
        getCoins(phone).then((result) {
          getStringFromSharedPrefs("coins").then((coins) {
            if (coins == "" || coins == null) {
              setState(() {
                addStringValueToSharedPrefs("coins", result);
                _coinsCount = result;
                if (int.parse(_coinsCount) > 0) {
                  _coinsText = "У вас есть доступны бонусы 100 DOROG";
                } else {
                  _coinsText = "У вас еще нет бонусов 100 DOROG";
                }
              });
            } else {
              setState(() {
                _coinsCount = result;
                if (int.parse(_coinsCount) > 0) {
                  _coinsText = "У вас есть доступны бонусы 100 DOROG";
                } else {
                  _coinsText = "У вас еще нет бонусов 100 DOROG";
                }

                if (result == coins) {
                } else {
                  addStringValueToSharedPrefs("coins", result);
                }
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
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
        title: Text("Мои бонусы",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await refreshData();
        },
        key: refreshKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                width: m_ScreenSize.width,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey[500].withOpacity(1),
                        spreadRadius: 0,
                        blurRadius: 0.0,
                        offset: Offset(0, 0.5), // changes position of shadow
                      ),
                    ],
                  ),
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "Мой баланс",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.money, size: 25),
                            SizedBox(width: 10),
                            Text(
                              _coinsCount.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        width: m_ScreenSize.width,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          _coinsText.toString(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                width: m_ScreenSize.width,
                padding: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      "У вас не было операций с бонусами",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AboutCoinsWidget();
                          },
                        ));
                      },
                      child: Text(
                        "Узнать про бонусы",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
