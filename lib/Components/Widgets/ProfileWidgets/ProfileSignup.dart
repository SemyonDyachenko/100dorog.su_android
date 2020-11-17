import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'ProfileLogin.dart';
import '../../../api/auth/auth_services.dart';

class ProfileSignup extends StatefulWidget {
  _ProfileSignup createState() => _ProfileSignup();
}

class _ProfileSignup extends State<ProfileSignup> {
  bool _rememberMe = true;
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Widget _buildPhoneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Телефон",
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
          child: TextFormField(
            controller: _phoneController,
            validator: (text) {
              _phoneValidator(text);
            },
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: Colors.black,
              ),
              hintText: "Номер телефона",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
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
          child: TextFormField(
            controller: _passwordController,
            validator: (text) {
              _passwordValidator(text);
            },
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
    );
  }

  Widget _buildRePasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Повтор пароля",
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
          child: TextFormField(
            obscureText: true,
            validator: (text) {
              if (text != _passwordController.text) {
                return "Пароли не совпадают";
              }
            },
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: "Повтор пароля",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        SizedBox(height: 25.0),
      ],
    );
  }

  Widget _buildRememberMe() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text("Запомнить меня"),
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          registerUser(
              _phoneController.text, _passwordController.text, _rememberMe);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color.fromARGB(500, 0, 132, 255),
        child: Text("Регистрация",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            )),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProfileLogin();
            },
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Уже есть аккаунт ? ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: " Войти",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    bool _login = true;

    getStringFromSharedPrefs('user_phone').then((value) {
      if (value == null) {
        setState(() {
          _login = false;
        });
      } else {
        setState(() {
          _login = true;
        });
      }
    });

    if (_login) {
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
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                _buildPhoneTextField(),
                SizedBox(height: 20.0),
                _buildPasswordTextField(),
                SizedBox(height: 20.0),
                _buildRePasswordTextField(),
                _buildRememberMe(),
                SizedBox(height: 10),
                _buildSignupButton(),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  String _phoneValidator(String value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);

    if (value.length == 0) {
      return "Введите номер телефона";
    } else if (!regExp.hasMatch(value)) {
      return "Введите правильный номер";
    }
    return null;
  }

  String _passwordValidator(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length < 8) {
      if (value.length == 0) {
        return "Введите пароль";
      } else if (regExp.hasMatch(value)) {
        return "Пароль должен состоять из букв и цифр";
      }
    } else if (value.length > 32) {
      return "Пароль больше 32 симоволов";
    } else {
      return "Пароль меньше 8 символов";
    }
    return null;
  }
}
