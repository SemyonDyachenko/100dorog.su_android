import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResultWidget extends StatefulWidget {
  _SearchResultWidget createState() => _SearchResultWidget();
}

class _SearchResultWidget extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        );
      }),
    );
  }
}
