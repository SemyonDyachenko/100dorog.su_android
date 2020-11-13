import 'package:http/http.dart' as http;

class User {
  String phone, password, email, firstname, lastname;
  DateTime borndate;
  bool _required;

  User(this.phone, this.password);

  User.map(dynamic obj) {
    this.phone = obj['phone'];
    this.password = obj['password'];
  }

  String get getPhone => phone;
  String get getPassword => password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["phone"] = phone;
    map["password"] = password;

    return map;
  }
}
