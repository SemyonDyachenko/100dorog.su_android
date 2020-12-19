import 'package:flutter/material.dart';

class AboutCoinsWidget extends StatefulWidget {
  _AboutCoinsWidget createState() => _AboutCoinsWidget();
}

class _AboutCoinsWidget extends State<AboutCoinsWidget> {
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
        title:
            Text("Бонусы", style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Что такое бонусы 100 DOROG ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                        "Бонусы 100 DOROG – это кэшбэк с оплаты тура. Они начисляются вам в личном кабинете. Чтобы получать бонусы необходимо зарегистрироваться в мобильном приложении «100 DOROG» и оплачивать бронирование туров."),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Как использовать бонусы 100 DOROG ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                        "Бонусы 100 DOROG начисляются каждый раз при оплате тура в размере 5 % от стоимости тура.При оплате бронирования можно использовать количество бонусов, не превышающее 30 % стоимости тура.Бонусы не начисляются если действует акция."),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
