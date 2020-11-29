import 'package:flutter/material.dart';
import 'package:travel/Components/Widgets/OrderWidgets.dart/ConfirmOrder.dart';
import 'package:travel/Components/Widgets/ProfileWidgets/ProfileLogin.dart';
import 'package:travel/Components/Widgets/ProfileWidgets/ProfileSignup.dart';
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/utils/CircularProgressBar.dart';
import '../../api/auth/auth_services.dart';

class TourWidget extends StatefulWidget {
  final int id;

  const TourWidget({Key key, @required this.id}) : super(key: key);

  @override
  _TourWidget createState() => _TourWidget();
}

class _TourWidget extends State<TourWidget> {
  var _register;
  Map<String, dynamic> tourData = Map<String, dynamic>();
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getTourById(widget.id).then((value) {
      setState(() {
        tourData = value;
      });
    });
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getTourById(widget.id).then((value) {
      setState(() {
        tourData = value;
      });
    });
  }

  void showLoginNavigator(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
              height: MediaQuery.of(context).size.height * .36, // .35
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      width: 50.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(500, 210, 210, 210),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Вы не авторизированы",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(200, 225, 225, 225)
                                .withOpacity(0.5),
                            spreadRadius: 0.1,
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              minWidth: 200,
                              height: 50,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfileSignup();
                                }));
                              },
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              color: Color.fromARGB(500, 0, 132, 255),
                              child: Text("Регистрация",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              minWidth: 200,
                              height: 50,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfileLogin();
                                }));
                              },
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              color: Color.fromARGB(500, 0, 132, 255),
                              child: Text("Войти",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      child: FlatButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Закрыть",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    getStringFromSharedPrefs("user_phone").then((value) {
      _register = value;
    });

    var m_ScreenSize = MediaQuery.of(context).size;

    return tourData.isNotEmpty
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: FlatButton(
                        minWidth: 25,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 25),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Подробнее о выбранном туре",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      minWidth: 25,
                      onPressed: () {},
                      child: Icon(Icons.share, color: Colors.white, size: 25),
                    ),
                  ),
                ],
              ),
            ),
            body: RefreshIndicator(
              key: refreshKey,
              onRefresh: () async {
                await refreshData();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: m_ScreenSize.width,
                      height: m_ScreenSize.height * .35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(tourData['url_path']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                tourData['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                tourData['event_date'].toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Цена",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    tourData['price'] +
                                        " / " +
                                        tourData['child_price'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 60),
                                  child: Text(
                                    "Возраст",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 60, top: 5),
                                  child: Text(
                                    "Взрослый / Ребенок",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 0, top: 0),
                                  child: FlatButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {},
                                      child: Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: m_ScreenSize.width * .90,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text("Описание",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Text(
                                tourData['description'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              )),
                          Container(
                            width: m_ScreenSize.width * .90,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text("Дополнительно",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 0),
                                    child: Text(
                                      "- Ливадийский дворец – 400 взр 250 льгот 100 дет",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "- Дворец Дюльбер – 350 руб/ чел",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "- Массандровский дворец – 350 взр 250 льгот 150 дет",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20, bottom: 10),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(color: Colors.transparent)),
                              minWidth: m_ScreenSize.width * .95,
                              height: 60,
                              color: Color.fromARGB(500, 0, 140, 255),
                              onPressed: () {
                                if (_register != null) {
                                  // if sign un
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ConfirmOrder(id: widget.id);
                                  }));
                                } else {
                                  // if not sign in
                                  showLoginNavigator(context);
                                }
                              },
                              child: Text("Забронировать",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : circularProgressBar();
  }
}
