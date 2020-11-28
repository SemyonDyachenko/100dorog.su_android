import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';

class Region {
  final String id;
  final String name;

  Region({this.id, this.name});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

getAllRegions() async {
  const url = "https://www.biquad.ru/dorogi/api/region/all.php";
  var response = await http.post(url);
  var responseArray = jsonDecode(response.body);

  List<Map<String, dynamic>> regions = List<Map<String, dynamic>>();

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      for (var i = 0;
          i < jsonDecode(responseArray['data'].toString()).length;
          i++) {
        Region region =
            Region.fromJson(jsonDecode(responseArray['data'].toString())[i]);
        regions.add(region.toMap());
      }

      return regions;
    } else {
      return responseArray['result'];
    }
  } else {
    return null;
  }
}
