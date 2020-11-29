import 'package:flutter/material.dart';

Widget circularProgressBar() {
  return Scaffold(
      body: Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    ),
  ));
}
