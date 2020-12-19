import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Favorite {
  String id;
  String tour_id;
  String user_id;
  String url_path;
  String price;
  String location;
  String name;

  Favorite({this.id, this.tour_id, this.user_id,this.url_path,this.price,this.location,this.name});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      tour_id: json['tour_id'],
      user_id: json['user_id'],
      url_path: json['url_path'],
      price: json['price'],
      location: json['tour_location'],
      name: json['tour_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tour_id': tour_id,
      'user_id': user_id,
      'url_path': url_path,
      'price': price,
      'location': location,
      'name': name,
    };
  }
}

addFavorite(String user_id,String tour_id,String url_path,String price,String location,String tour_name) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/favorite/add.php";

  var data = {"user_id": user_id, "tour_id": tour_id,"url_path": url_path,"price": price,"location": location,"tour_name": tour_name};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      return "success";
    } else {
      return "error";
    }
  }
}

isFavorite(String user_id, tour_id) async {
  const url =
      "https://www.100dorog-servives.info/dorogi/api/favorite/is_favorite.php";

  var data = {"user_id": user_id, "tour_id": tour_id};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "true") {
      return "true";
    } else if (responseArray['result'] == "false") {
      return "false";
    } else {
      return "error";
    }
  }
}

removeFavorite(String user_id, tour_id) async {
  const url =
      "https://www.100dorog-servives.info/dorogi/api/favorite/delete.php";

  var data = {"user_id": user_id, "tour_id": tour_id};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      return "success";
    } else {
      return "error";
    }
  }
}

getFavorites(String user_id) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/favorite/get_all.php";

  var data = {"user_id": user_id};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  List<Map<String, dynamic>> favorites = List<Map<String, dynamic>>();

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      for (var i = 0;
          i < jsonDecode(responseArray['data'].toString()).length;
          i++) {
        Favorite region =
            Favorite.fromJson(jsonDecode(responseArray['data'].toString())[i]);
        favorites.add(region.toMap());
      }
      if (favorites.isNotEmpty) {
        return favorites;
      } else {
        return null;
      }
      // here adding to orders list
    } else if (responseArray['result'] == "error") {
      return "error";
    } else if (responseArray['result'] == "empty") {
      return "empty";
    } else {
      return responseArray['result'];
    }
  }
}
