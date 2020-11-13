import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

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

  return (responseCode);
}

void logoutUser() {}

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
