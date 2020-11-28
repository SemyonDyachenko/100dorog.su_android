import 'package:flutter/material.dart';
import 'ProfileSignup.dart';

class ProfileIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0),
            height: m_ScreenSize.height * 0.1,
            alignment: Alignment.center,
            child: Text(
              'Добро пожаловать',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 50),
            width: m_ScreenSize.width / 1,
            height: m_ScreenSize.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/100.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width * 0.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Color.fromARGB(500, 0, 120, 255),
                onPressed: () {},
                child: Text("Войти",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width * 0.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Color.fromARGB(150, 0, 120, 255),
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
                child: Text("Регистрация",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: Text(
              'Зачем нужен аккаунт?',
              style: TextStyle(
                color: Color.fromARGB(500, 0, 120, 255),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
