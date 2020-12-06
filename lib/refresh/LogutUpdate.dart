import 'package:flutter/material.dart';

class LogoutWidget extends StatefulWidget {
  @override
  _LogoutWidget createState() => _LogoutWidget();
}

class _LogoutWidget extends State<LogoutWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Navigator.pop(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }
}
