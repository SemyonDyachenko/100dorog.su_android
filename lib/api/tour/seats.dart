import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Tour.dart';

getAllSeats(int tour_id) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/tour/get_tour.php";
  var data = {"id": tour_id.toString()};
  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      Tour tour = Tour.fromJson(jsonDecode(responseArray['data'].toString()));
      return tour.toMap()['seats_count'];
    } else {
      return "error";
    }
  } else {
    return null;
  }
}

getPurchasedSeats(int tour_id) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/tour/get_tour.php";
  var data = {"id": tour_id.toString()};
  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      Tour tour = Tour.fromJson(jsonDecode(responseArray['data'].toString()));
      return tour.toMap()['purchased_seats'];
    } else {
      return "error";
    }
  } else {
    return null;
  }
}