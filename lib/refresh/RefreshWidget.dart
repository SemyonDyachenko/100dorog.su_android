import 'package:flutter/material.dart';

class SwipeToRefreshExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeToRefreshState();
  }
}

class _SwipeToRefreshState extends State<SwipeToRefreshExample> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
