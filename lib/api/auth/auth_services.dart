import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';

Future registerUser(String phone, String password, bool remember) async {
  const url = "https://www.biquad.ru/dorogi/api/user/add.php";
  var data = {"phone": phone, "password": password};
  var response = await http.post(url, body: data);

  if (jsonDecode(response.body)["result"] == "exists") {
    return "exists";
  } else {
    if (jsonDecode(response.body)["result"] == "success") {
      if (remember) {
      } else {
        return "success";
      }
    } else {
      return "error";
    }
  }
}

Future<String> loginUser(String phone, String password) async {
  const url = "https://www.biquad.ru/dorogi/api/user/auth.php";
  var data = {"phone": phone, "password": password};
  var response = await http.post(url, body: data);
  var responseCode = await jsonDecode(response.body)["result"];

  return responseCode;
}

class User {
  final String id;
  final String email;
  final String phone;
  final String firstname;
  final String lastname;
  final String coins;

  User(
      {this.id,
      this.email,
      this.phone,
      this.firstname,
      this.lastname,
      this.coins});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      coins: json['coins'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'coins': coins,
    };
  }
}

getUserData(String phone) async {
  const url = "https://www.biquad.ru/dorogi/api/user/data.php";
  var data = {"phone": phone};
  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  User user = User.fromJson(jsonDecode(responseArray['data'].toString()));

  return user.toMap();
}

void logoutUser() {
  clearSharedPrefs();
}

class AuthService {
  static final SESSION = FlutterSession();

  static setToken(String token, String refreshToken, String clientId) async {
    _AuthData data = _AuthData(token, refreshToken, clientId);
    return await SESSION.set('tokens', data);
  }

  static getToken() async {
    return await SESSION.get('tokens');
  }
}

class _AuthData {
  String token, refreshToken, clientId;
  _AuthData(this.token, this.refreshToken, this.clientId);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;

    return data;
  }
}
