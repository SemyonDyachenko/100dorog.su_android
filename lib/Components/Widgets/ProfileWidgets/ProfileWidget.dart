import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/Components/Widgets/ProfileWidgets/NotificationWidget.dart';
import 'package:travel/Components/Widgets/ProfileWidgets/RegionSettings.dart';
import 'package:travel/api/auth/auth_services.dart';
import 'package:travel/api/auth/preferences.dart';
import 'CoinsWidget.dart';
import 'ProfileSettings.dart';
import 'UserDataWidget.dart';
import 'ProfileSignup.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWidget extends StatefulWidget {
  _ProfileWidget createState() => _ProfileWidget();
}

class _ProfileWidget extends State<ProfileWidget> {
  String _firstname, _lastname, _phone;
  var _coinsCount = "0";

  @override
  void initState() {
    super.initState();
    getStringFromSharedPrefs("user_phone").then((phone) {
      getCoins(phone).then((result) {
        getStringFromSharedPrefs("coins").then((coins) {
          if (coins == "" || coins == null) {
            setState(() {
              addStringValueToSharedPrefs("coins", result);
              _coinsCount = result;
            });
          } else {
            setState(() {
              _coinsCount = result;

              if (result == coins) {
              } else {
                addStringValueToSharedPrefs("coins", result);
              }
            });
          }
        });
      });
    });
  }

  Widget _buildSettingsElement() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProfileSettings();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Насройки профиля",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                "",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoneyElement() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Язык",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                "Русский",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationElement() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NotificationWidget();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Уведомления",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                "Все",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionElement() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RegionSettings();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Регион",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                "Абинск",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  createLogoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Вы действительно хотите выйти из аккаунта?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromARGB(500, 59, 204, 122),
                child: Text("Отмена",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              FlatButton(
                onPressed: () {
                  logoutUser();
                },
                color: Color.fromARGB(200, 247, 72, 72),
                child: Text("Да"),
              ),
            ],
          );
        });
  }

  Widget buildPersonalInfoContainer(BuildContext context) {
    getStringFromSharedPrefs("user_phone").then((value) {
      setState(() {
        _phone = value;
      });
    });

    getStringFromSharedPrefs("firstname").then((value) {
      setState(() {
        _firstname = value;
      });
    });

    getStringFromSharedPrefs("lastname").then((value) {
      setState(() {
        _lastname = value;
      });
    });

    return FlatButton(
      color: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UserDataWidget();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 0, bottom: 15, right: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "SD",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      _firstname == null
                          ? _phone
                          : _firstname + " " + _lastname,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'контактные данные',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 80),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
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

    List text = [1, 2, 3, 4, 5];

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Профиль", style: TextStyle(color: Colors.black)),
              FlatButton(
                minWidth: 20,
                onPressed: () {
                  createLogoutDialog(context);
                },
                child: Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildPersonalInfoContainer(context),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    for (var i in text)
                      Container(
                        margin: EdgeInsets.only(left: 3, right: 3),
                        child: FlatButton(
                          color: Colors.white,
                          minWidth: 150,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CoinsWidget();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: Colors.grey[100], width: 1),
                            ),
                            margin: EdgeInsets.only(left: 0, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: Text(
                                    "Бонусы",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.money,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        _coinsCount.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildRegionElement(),
            _buildMoneyElement(),
            _buildNotificationElement(),
            _buildSettingsElement(),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.grey[200]),
                borderRadius: BorderRadius.circular(6),
              ),
              width: m_ScreenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Связаться с нами?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Найдите ответ на свой вопрос, наши контакты:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          onPressed: () => launch("tel://+79180643382"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(color: Colors.transparent)),
                          child: Text(
                            "+7 918 064 33 82",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          color: Color.fromARGB(500, 59, 204, 122),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(color: Colors.transparent)),
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey[200]),
                borderRadius: BorderRadius.circular(6),
              ),
              width: m_ScreenSize.width * .9,
              child: FlatButton(
                minWidth: m_ScreenSize.width * .9,
                height: 60,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {},
                child: Text(
                  "Оцените наше приложение",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: m_ScreenSize.width * .6,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Политика обработки данных и информации v 1.0.0",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
