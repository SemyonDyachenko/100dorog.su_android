import 'dart:convert';

import 'package:http/http.dart' as http;

class Order {
  int orderId;
  String type;
  String tourName;
  int tourId;
  DateTime orderDateTime;
  DateTime paymentDateTime;
  String status;
  bool isPayment;
  int sum;
  int userId;
  String userEmail;

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
      this.userEmail});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['id'] as int,
      type: json['type'] as String,
      tourName: json['tour_name'] as String,
      tourId: json['tour_id'] as int,
      orderDateTime: json['order_datetime'] as DateTime,
      paymentDateTime: json['payment_datetime'] as DateTime,
      status: json['status'] as String,
      isPayment: json['is_payment'] as bool,
      sum: json['sum'] as int,
      userId: json['user_id'] as int,
      userEmail: json['user_email'] as String,
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
    String userEmail) async {
  const url = "https://biquad.ru/dorogi/api/order/create.php";
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
  };

  var response = await http.post(url, body: data);
  var responseArray = jsonDecode(response.body);

  if (response.body != null) {
    if (responseArray['result'] == "success") {
      return "success";
    } else if (responseArray['result'] == "error") {
      return "error";
    } else if (responseArray['result'] == "empty") {
      return "empty";
    } else {
      return responseArray['result'];
    }
  }
}

getOrders(String userId) async {
  const url = "https://biquad.ru/dorogi/api/order/get_all.php";

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
      return orders;
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
