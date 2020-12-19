import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../../../api/auth/preferences.dart';
import '../../../api/auth/auth_services.dart';

class ProfileLogin extends StatefulWidget {
  _ProfileLogin createState() => _ProfileLogin();
}

class _ProfileLogin extends State<ProfileLogin> {
  bool _rememberMe = true;

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String authErrorCode = " ";

  void changeErrorCode(String code) {
    switch (code) {
      case 'password':
        setState(() {
          authErrorCode = "Пароль наверный";
        });
        break;
      case 'none':
        setState(() {
          authErrorCode = "Пользователя с таким e-mail не существует";
        });
        break;
      case 'error':
        setState(() {
          authErrorCode = "Ошибка авторизации";
        });
        break;
      case 'success':
        setState(() {
          authErrorCode = " ";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    var _register;
    getStringFromSharedPrefs("user_email").then((value) {
      _register = value;
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: m_ScreenSize.width,
                child: Text(
                  'Авторизация',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "E-mail",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: Colors.black,
                        ),
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Пароль",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: "Введите пароль",
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 0),
                alignment: Alignment.center,
                width: m_ScreenSize.width,
                child: Text(
                  "$authErrorCode",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    loginUser(_phoneController.text, _passwordController.text)
                        .then((value) {
                      changeErrorCode(value);
                      if (value == "success") {
                        addStringValueToSharedPrefs(
                            "user_email", _phoneController.text);
                        getUserData(_phoneController.text).then((value) {
                          addStringValueToSharedPrefs("user_id", value['id']);
                          if (value['phone'] != "") {
                            addStringValueToSharedPrefs(
                                "phone", value['phone']);
                          }
                          addStringValueToSharedPrefs(
                              "firstname", value['firstname']);
                          addStringValueToSharedPrefs(
                              "lastname", value['lastname']);
                          if (value['coins'] != "") {
                            addStringValueToSharedPrefs(
                                "coins", value['coins']);
                          }
                        });
                        Phoenix.rebirth(context);
                      }
                    });
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color.fromARGB(500, 0, 132, 255),
                  child: Text("Войти",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      )),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Нет аккаунта ? ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: " Регистрация",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
