

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class CopyrightWidget extends StatefulWidget {

  _CopyrightWidget createState() => _CopyrightWidget();
}

class _CopyrightWidget extends State<CopyrightWidget> {
  @override
  void initState() {
    super.initState();

  }

  String initialUrl = "https://100dorog-servives.info/dorogi/copyright.php";

  @override
  Widget build(BuildContext context) {

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
        title: Text("Политика обработки данных",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
