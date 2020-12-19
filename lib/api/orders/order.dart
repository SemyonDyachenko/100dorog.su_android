import 'dart:convert';

import 'package:http/http.dart' as http;

class Order {
  String orderId;
  String type;
  String tourName;
  String tourId;
  String orderDateTime;
  String paymentDateTime;
  String status;
  String isPayment;
  String sum;
  String userId;
  String userEmail;
  String bonusUsed;
  String seatsCount;

  Order(
      {this.orderId,
      this.type,
      this.tourName,
      this.tourId,
      this.orderDateTime,
      this.paymentDateTime,
      this.status,
      this.isPayment,
      this.sum,
      this.userId,
      this.userEmail,
      this.bonusUsed,this.seatsCount});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['id'] as String,
      type: json['type'] as String,
      tourName: json['tour_name'] as String,
      tourId: json['tour_id'] as String,
      orderDateTime: json['order_datetime'] as String,
      paymentDateTime: json['payment_datetime'] as String,
      status: json['status'] as String,
      isPayment: json['is_payment'] as String,
      sum: json['sum'] as String,
      userId: json['user_id'] as String,
      userEmail: json['user_email'] as String,
      bonusUsed: json['bonus_used'] as String,
      seatsCount: json['seats_count'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'type': type,
      'tourName': tourName,
      'tourId': tourId,
      'orderDateTime': orderDateTime,
      'paymentDateTime': paymentDateTime,
      'status': status,
      'isPayment': isPayment,
      'sum': sum,
      'userId': userId,
      'userEmail': userEmail,
      'bonusUsed': bonusUsed,
      'seats_count': seatsCount,
    };
  }
}

createOrder(
    String type,
    String tourName,
    int tourId,
    String orderDateTime,
    String status,
    bool isPayment,
    int sum,
    int userId,
    String userEmail,
    String bonusUsed,String seatsCount) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/order/create.php";
  var data = {
    "type": type,
    "tour_name": tourName,
    "tour_id": tourId.toString(),
    "order_datetime": orderDateTime,
    "status": status,
    "is_payment": isPayment.toString(),
    "sum": sum.toString(),
    "user_id": userId.toString(),
    "user_email": userEmail,
    "bonus_used": bonusUsed,
    "seats_count": seatsCount,
  };

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      return responseArray['id'];
    } else if (responseArray['result'] == "error") {
      return "error";
    } else if (responseArray['result'] == "empty") {
      return "empty";
    } else {
      return "Error";
    }
  } else {
    return "null";
  }
}

getOrders(String userId) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/order/get_all.php";

  var data = {"user_id": userId};

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  List<Map<String, dynamic>> orders = List<Map<String, dynamic>>();

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      for (var i = 0;
          i < jsonDecode(responseArray['data'].toString()).length;
          i++) {
        Order region =
            Order.fromJson(jsonDecode(responseArray['data'].toString())[i]);
        orders.add(region.toMap());
      }
      if (orders.isNotEmpty) {
        return orders;
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

deleteOrder(String order_id) async {
  const url = "https://www.100dorog-servives.info/dorogi/api/order/delete.php";

  var data = {"id": order_id};

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
