import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/api/orders/order.dart';
import 'package:travel/utils/CircularProgressBar.dart';
import 'package:travel/utils/DatetimeUtils.dart';
import 'AboutCoinsWidget.dart';
import '../../../api/auth/auth_services.dart';

class OrdersWidget extends StatefulWidget {
  _OrdersWidget createState() => _OrdersWidget();
}

class _OrdersWidget extends State<OrdersWidget> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  List<Map<String, dynamic>> orders = List<Map<String, dynamic>>();
  bool haveResult = false;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getStringFromSharedPrefs("user_id").then((id) {
      getOrders(id).then((result) {
        if (result != null) {
          setState(() {
            orders = result;
            haveResult = true;
          });
        } else {
          haveResult = true;
          setState(() {});
        }
      });
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));

    getStringFromSharedPrefs("user_id").then((id) {
      getOrders(id).then((result) {
        if (result != null) {
          setState(() {
            orders = result;
            haveResult = true;
          });
        } else {
          haveResult = true;
          setState(() {});
        }
      });
    });
  }

  Widget orderCard(BuildContext context, String order_id, String order_name,
      String tour_id, String order_date, String status, String order_sum) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.5,
              offset: Offset(0, 0),
              color: Colors.grey[400],
            ),
          ],
        ),
        width: m_ScreenSize.width * .9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    "Заказ от " +
                        DateTime.parse(order_date).day.toString() +
                        " " +
                        monthKeyToString(
                                DateTime.parse(order_date).month.toString(),
                                true)
                            .toLowerCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 15),
                  child: FlatButton(
                    minWidth: 50,
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      if (status != "accepted") {
                        deleteOrder(order_id).then((value) async {
                          if (value == "success") {
                            if (orders.length == 1) {
                              orders.clear();
                            }
                            await refreshData();
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Заказ успешно удален"),
                            ));
                          }
                        });
                      }
                    },
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: status == "accepted"
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 15),
              child: Text(
                "Номер заказа: 000-" + order_id,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 0),
              width: m_ScreenSize.width * .9,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    order_name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  height: 25,
                  decoration: BoxDecoration(
                    color: status == "accepted"
                        ? Colors.green[300]
                        : Color.fromARGB(400, 112, 128, 144),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    status == "accepted" ? "Оплачен" : "Ожидает оплаты",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Text("Сумма заказа: " + order_sum + " RUB"),
            ),
            status == "accepted"
                ? Container(
                    margin: EdgeInsets.only(top: 15, left: 15, bottom: 25),
                    child: FlatButton(
                        padding: EdgeInsets.all(5),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {},
                        color: Color.fromARGB(400, 112, 128, 144),
                        child: Text("Отменить бронирование",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12))),
                  )
                : Container(
                    height: 10,
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return haveResult
        ? Scaffold(
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
              key: refreshKey,
              onRefresh: () async {
                await refreshData();
              },
              child: Builder(
                builder: (context) => SingleChildScrollView(
                  child: orders.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var i = 0; i < orders.length; i++)
                              orderCard(
                                  context,
                                  orders[i]['orderId'],
                                  orders[i]['tourName'].toString(),
                                  orders[i]['tourId'],
                                  orders[i]['orderDateTime'].toString(),
                                  orders[i]['status'].toString(),
                                  orders[i]['sum'].toString()),
                            SizedBox(height: 20),
                          ],
                        )
                      : circularProgressBar(),
                ),
              ),
            ),
          )
        : circularProgressBar();
  }
}
