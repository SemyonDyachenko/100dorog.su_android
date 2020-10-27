import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
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
            padding: EdgeInsets.only(top: 0),
            child: Form(
              child: Wrap(
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
