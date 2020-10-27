import 'package:flutter/material.dart';

class ToursPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ToursPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This main page'),
      ),
    );
  }
}
