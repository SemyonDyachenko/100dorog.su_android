import 'package:flutter/material.dart';
import 'package:travel/api/auth/auth_services.dart';
import 'package:travel/api/orders/order.dart';


class FavoritesController {

  static Map<String,dynamic> getTourDataById(int tourId) {
    getTourById(tourId).then((value) {
      if(value!= null) {
        return value;
      }
      else {
        return null;
      }
    });
    return null;
  }


}