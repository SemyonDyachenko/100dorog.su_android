import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Components/TabPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100 DOROG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsPage(),
    );
  }
}
