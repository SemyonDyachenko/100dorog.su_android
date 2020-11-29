import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YandexPayment extends StatefulWidget {
  final String tourName;
  final int sum;

  const YandexPayment({Key key, @required this.tourName, @required this.sum})
      : super(key: key);

  _YandexPayment createState() => _YandexPayment();
}

class _YandexPayment extends State<YandexPayment> {
  final String paymentString = "https://yoomoney.ru/quickpay/confirm.xml";
  final String target = "Бронирование тура";
  final String quickpayForm = "shop";
  final String paymentType = "AC";
  final String receiver = "?receiver=79673067936";

  String initialUrl = "";

  @override
  Widget build(BuildContext context) {
    initialUrl = paymentString +
        receiver +
        "&target=" +
        target +
        "&quickpay-form=" +
        quickpayForm +
        "&paymentType=" +
        paymentType +
        "&targets=" +
        target +
        "&sum=" +
        widget.sum.toString();

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
        title: Text("Закройте после оплаты",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
