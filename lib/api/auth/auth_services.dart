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

class Tour {
  final String id;
  final String name;
  final String url_path;
  final String description;
  final String option_description;
  final String price;
  final String child_price;
  final String seats_count;
  final String purchased_seats;
  final String created;
  final String modified;
  final String bonus_count;
  final String bonus_canused;
  final String event_datetime;

  Tour({
    this.id,
    this.name,
    this.url_path,
    this.description,
    this.option_description,
    this.price,
    this.child_price,
    this.seats_count,
    this.purchased_seats,
    this.created,
    this.modified,
    this.bonus_count,
    this.bonus_canused,
    this.event_datetime,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['id'] as String,
      name: json['name'] as String,
      url_path: json['url_path'] as String,
      description: json['description'] as String,
      option_description: json['option_description'] as String,
      price: json['price'] as String,
      child_price: json['child_price'] as String,
      seats_count: json['seats_count'] as String,
      purchased_seats: json['purchased_seats'] as String,
      created: json['created'] as String,
      modified: json['modified'] as String,
      bonus_count: json['bonus_additem'] as String,
      bonus_canused: json['bonus_canused'] as String,
      event_datetime: json['event_datetime'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url_path': url_path,
      'description': description,
      'option_description': option_description,
      'price': price,
      'child_price': child_price,
      'seats_count': seats_count,
      'purchased_seats': purchased_seats,
      'created': created,
      'modified': modified,
      'bonus_count': bonus_count,
      'bonus_canused': bonus_canused,
      'event_datetime': event_datetime,
    };
  }
}

getAllTours() async {
  const url = "https://biquad.ru/dorogi/api/tour/all_tours.php";
  var response = await http.post(url);
  var responseArray = jsonDecode(response.body);

  List<Map<String, dynamic>> tours = [];

  for (var i = 0;
      i < jsonDecode(responseArray['data'].toString()).length;
      i++) {
    Tour tour = Tour.fromJson(jsonDecode(responseArray['data'].toString())[i]);
    tours.add(tour.toMap());
  }

  return tours;
}

getTourById(int id) async {
  const url = "https://biquad.ru/dorogi/api/tour/get_tour.php";
  var data = {"id": id};
  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (responseArray['result'] == "success") {
    Tour tour = Tour.fromJson(jsonDecode(responseArray['data'].toString()));
    return tour.toMap();
  } else {
    return "error";
  }
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

setContacts(
    String phone, String firstname, String lastname, String email) async {
  const url = "https://www.biquad.ru/dorogi/api/user/update_contacts.php";
  var data = {
    "phone": phone,
    "firstname": firstname,
    "lastname": lastname,
    "email": email
  };

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body)['result'];

  return responseArray;
}

void logoutUser() {
  clearSharedPrefs();
}

addCoins(String token, String phone, String count) async {
  const url = "https://www.biquad.ru/dorogi/api/user/add_coins.php";
  var data = {"token": token, "phone": phone, "count": count};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body)['result'];

  return responseArray;
}

getCoins(String phone) async {
  const url = "https://www.biquad.ru/dorogi/api/user/get_coins.php";
  var data = {"phone": phone};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (responseArray['result'] == "success") {
    return responseArray['count'];
  } else {
    return "error";
  }
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
