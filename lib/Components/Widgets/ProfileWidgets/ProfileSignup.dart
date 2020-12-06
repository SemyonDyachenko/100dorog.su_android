import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/api/orders/order.dart';
import 'ProfileLogin.dart';
import '../../../api/auth/auth_services.dart';

class ProfileSignup extends StatefulWidget {
  _ProfileSignup createState() => _ProfileSignup();
}

class _ProfileSignup extends State<ProfileSignup> {
  bool _rememberMe = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  GlobalKey<RefreshIndicatorState> refreshKey;
  bool _signButtonDisabled = true;

  String authErrorCode = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getStringFromSharedPrefs("user_email").then((value) {
      if (value != null && value != "") {}
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));

    getStringFromSharedPrefs("user_id").then((id) {
      getOrders(id).then((value) {
        setState(() {});
      });
    });
  }

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  void inputVaidate() {
    if (_emailController.text != "" &&
        _passwordController.text != "" &&
        _confirmPasswordController.text != "") {
      if (_passwordController.text == _confirmPasswordController.text) {
        if (_emailController.text.length > 6) {
          if (isPasswordCompliant(_passwordController.text)) {
            setState(() {
              _signButtonDisabled = false;
            });
          } else {
            setState(() {
              _signButtonDisabled = true;
            });
          }
        }
      }
    }
  }

  void changeErrorCode(String code) {
    switch (code) {
      case 'not_numbers':
        setState(() {
          authErrorCode = "Пароль должен содержать цифры";
        });
        break;
      case 'short':
        setState(() {
          authErrorCode = "Пароль должен быть длинее 8 символов";
        });
        break;
      case 'password':
        setState(() {
          authErrorCode = "Пароли не совпадают";
        });
        break;
      case 'error':
        setState(() {
          authErrorCode = "Ошибка регистрации";
        });
        break;
      case 'success':
        setState(() {
          authErrorCode = " ";
        });
        break;
      case 'exists':
        setState(() {
          authErrorCode = "Пользователь с такими телефоном уже существует";
        });
    }
  }

  Widget _buildEmailTextField() {
    return Column(
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
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              hintText: "E-mail",
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
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: true,
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

  Widget _buildSignupButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        disabledColor: Colors.grey[300],
        elevation: 5.0,
        onPressed: () {
          if (_passwordController.text == _confirmPasswordController.text) {
            if (_passwordController.text.length >= 8) {
              if (_passwordController.text.contains(new RegExp(r'[0-9]'))) {
                registerUser(_emailController.text, _passwordController.text,
                        _rememberMe)
                    .then((value) {
                  if (value == "success") {
                    loginUser(_emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == "success") {
                        addStringValueToSharedPrefs(
                            "user_email", _emailController.text);
                        getUserData(_emailController.text).then((value) {
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
                  } else if (value == "exists") {
                    changeErrorCode("exists");
                  }
                });
              } else {
                changeErrorCode("not_numbers");
              }
            } else {
              changeErrorCode("short");
            }
          } else {
            changeErrorCode("password");
          }
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
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await refreshData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
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
                _buildEmailTextField(),
                SizedBox(height: 20.0),
                _buildPasswordTextField(),
                SizedBox(height: 20.0),
                _buildRePasswordTextField(),
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
                SizedBox(height: 10),
                _buildSignupButton(context),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
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
