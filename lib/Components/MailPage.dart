import 'package:flutter/material.dart';
import 'package:travel/api/auth/preferences.dart';

import 'Widgets/ProfileWidgets/ProfileSignup.dart';

class MailPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MailPage(),
      );
  _MailPage createState() => _MailPage();
}

class _MailPage extends State<MailPage> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  String _firstline = "";
  String _lastline = "";
  bool _showSignButton = false;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getStringFromSharedPrefs("user_phone").then((value) {
      if (value == null) {
        setState(() {
          _firstline = "Создайте аккаунт";
          _lastline =
              "Войдите в профиль или зарегестрируйтесь чтобы получать уведомления о новых поездках";
          _showSignButton = true;
        });
      } else {
        setState(() {
          _firstline = "Список уведомлений пуст";
          _lastline = "У вас нет уведомлений о новых поездках и акциях.";
        });
        _showSignButton = false;
      }
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getStringFromSharedPrefs("user_phone").then((value) {
      if (value == null) {
        setState(() {
          _firstline = "Создайте аккаунт";
          _lastline =
              "Войдите в профиль или зарегестрируйтесь чтобы получать уведомления о новых поездках";
          _showSignButton = true;
        });
      } else {
        setState(() {
          _firstline = "Список уведомлений пуст";
          _lastline = "У вас нет уведомлений о новых поездках и акциях.";
        });
        _showSignButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Уведомления", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await refreshData();
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 10),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  _firstline ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                alignment: Alignment.center,
                child: Text(
                  _lastline ?? "",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (_showSignButton)
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(500, 0, 132, 255),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .45),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: MediaQuery.of(context).size.width * .9,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileSignup();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Регистрация",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
