import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Components/TabPages.dart';

void main() {
  runApp(
    Phoenix(child: MyApp()),
  );
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
      home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new TabsPage(
            index: 0,
          ),
          image: new Image.asset('assets/100.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.transparent),
    );
  }
}
