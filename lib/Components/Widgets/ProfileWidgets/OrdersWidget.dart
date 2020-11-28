import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'AboutCoinsWidget.dart';
import '../../../api/auth/auth_services.dart';

class OrdersWidget extends StatefulWidget {
  _OrdersWidget createState() => _OrdersWidget();
}

class _OrdersWidget extends State<OrdersWidget> {
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 22,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text("Мои туры",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await refreshData();
        },
        key: refreshKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
