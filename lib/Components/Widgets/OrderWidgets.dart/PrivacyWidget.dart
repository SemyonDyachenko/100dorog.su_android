import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyWidget extends StatefulWidget {
  @override
  _PrivacyWidget createState() => _PrivacyWidget();
}

class _PrivacyWidget extends State<PrivacyWidget> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://100dorog.su/oplata',
    );
  }
}
