import 'package:flutter/material.dart';
import 'package:travel/api/orders/order.dart';
import 'package:travel/utils/CircularProgressBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YandexPayment extends StatefulWidget {
  final String tourName;
  final int sum;
  final int user_id;
  final int orderId;

  const YandexPayment(
      {Key key,
      @required this.tourName,
      @required this.sum,
      @required this.user_id,
      @required this.orderId})
      : super(key: key);

  _YandexPayment createState() => _YandexPayment();
}

class _YandexPayment extends State<YandexPayment> {
  final String paymentString = "https://yoomoney.ru/quickpay/confirm.xml";
  final String target = "Бронирование тура";
  final String quickpayForm = "shop";
  final String paymentType = "AC";
  final String receiver = "?receiver=79881325148";
  List<Map<String, dynamic>> orders = List<Map<String, dynamic>>();
  String order_id = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      order_id = widget.orderId.toString();
    });
  }

  String initialUrl = "";

  @override
  Widget build(BuildContext context) {
    initialUrl = paymentString +
        receiver +
        "&target=" +
        target +
        "&need-email=" +
        "true" +
        "&quickpay-form=" +
        quickpayForm +
        "&label=" +
        order_id +
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
