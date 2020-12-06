import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/Components/Widgets/ProfileWidgets/ProfileSignup.dart';
import 'package:travel/api/auth/preferences.dart';
import 'Widgets/ProfileWidgets/ProfileIntroduce.dart';
import 'Widgets/ProfileWidgets/ProfileWidget.dart';

class ProfilePage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ProfilePage(),
      );
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  var _register;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getStringFromSharedPrefs("user_email").then((value) {
      _register = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    getStringFromSharedPrefs("user_email").then((value) {
      _register = value;
    });

    /*return Scaffold(
        body: SafeArea(
      child: ProfileSignup(),
    ));*/

    if (_register == null) {
      return ProfileSignup();
    } else {
      return ProfileWidget();
    }
  }
}

/*
Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(
              alignment: Alignment.center,
              width: m_ScreenSize.width,
              child: Text(
                'Регистрация',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(
              width: m_ScreenSize.width / 2,
              height: m_ScreenSize.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/100.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Form(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return "Phone is required";
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    width: m_ScreenSize.width * .70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 230, 230, 230),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Icon(Icons.lock_outline),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text('*****************'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    width: m_ScreenSize.width * .70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 230, 230, 230),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Icon(Icons.lock_outline),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text('*****************'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    width: m_ScreenSize.width * .70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(500, 0, 120, 255),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      minWidth: m_ScreenSize.width * .70,
                      onPressed: () {},
                      child: Text(
                        'Отправить',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
*/
