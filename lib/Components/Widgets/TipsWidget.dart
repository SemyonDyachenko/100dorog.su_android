import 'package:flutter/material.dart';

class TipsWidget extends StatefulWidget {
  _TipsWidget createState() => _TipsWidget();
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => TipsWidget(),
  );
}

class _TipsWidget extends State<TipsWidget> {
  List<Map<String, dynamic>> allTours = List<Map<String, dynamic>>();
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(""),
          ),
        ),
        child: Column(

        ),
      ),
    );
  }

}