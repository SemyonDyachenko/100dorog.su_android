import 'package:flutter/material.dart';
import 'package:travel/api/orders/order.dart';


class OrderController {

  static Map<String,dynamic> getOrdersById(int userId) {
    getOrders(userId.toString()).then((value) {
      if(value!= null) {
        return value;
      }
      else {
        return null;
      }
    });
    return null;
  }

  static checkReOrder(int tourId,int userId) {
    /* if(getOrdersById(userId))
    List<Map<String,dynamic>> orders = getOrdersById(userId);
  }*/
  }

}