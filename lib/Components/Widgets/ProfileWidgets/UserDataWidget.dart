import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'ProfileLogin.dart';
import '../../../api/auth/auth_services.dart';

class UserDataWidget extends StatefulWidget {
  _UserDataWidget createState() => _UserDataWidget();
}

class _UserDataWidget extends State<UserDataWidget> {
  String _firstname, _lastname, _email;
  TextEditingController _firstnameController;
  TextEditingController _lastnameController;
  TextEditingController _emailController;
  TextEditingController _datebornControler = new TextEditingController();

  @override
  void initState() {
    getStringFromSharedPrefs("user_email").then((value) {
      setState(() {
        _email = value;
        _emailController = new TextEditingController(text: _email);
      });
    });

    getStringFromSharedPrefs("lastname").then((value) {
      setState(() {
        _lastname = value;
        _lastnameController = new TextEditingController(text: _lastname);
      });
    });

    getStringFromSharedPrefs("firstname").then((value) {
      setState(() {
        _firstname = value;
        _firstnameController = new TextEditingController(text: _firstname);
      });
    });
  }

  Widget _buildFirstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Имя",
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
            controller: _firstnameController,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 0.0, left: 14.0),
              hintText: "Имя",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Фамилия",
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
            controller: _lastnameController,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 0.0, left: 14.0),
              hintText: "Фамилия",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
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
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 0.0, left: 14.0),
              hintText: "E-mail",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatebornField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Дата рождения",
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
            controller: _datebornControler,
            keyboardType: TextInputType.datetime,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 0.0, left: 14.0),
              hintText: "Дата рождения",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
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
        title: Text("Персональные данные",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Мои данные",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildFirstNameField(),
              SizedBox(height: 20),
              _buildLastNameField(),
              SizedBox(height: 20),
              _buildEmailField(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    getStringFromSharedPrefs("user_phone").then((phone) {
                      setContacts(phone, _firstnameController.text,
                              _lastnameController.text, _emailController.text)
                          .then((value) {
                        addStringValueToSharedPrefs(
                            "firstname", _firstnameController.text);
                        addStringValueToSharedPrefs(
                            "lastname", _lastnameController.text);
                        addStringValueToSharedPrefs(
                            "user_email", _emailController.text);
                        Navigator.pop(context);
                      });
                    });
                  },
                  padding: EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: Color.fromARGB(500, 0, 132, 255),
                  child: Text("Сохранить",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
