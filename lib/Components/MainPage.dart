import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel/Components/SearchPage.dart';
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/utils/CircularProgressBar.dart';
import '../api/auth/auth_services.dart';
import 'Widgets/TourWidget.dart';
import 'package:travel/utils/DatetimeUtils.dart';

class MainPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MainPage(),
      );
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  var rng = new Random();
  ScrollController _scrollController = new ScrollController();
  List<Map<String, dynamic>> allTours = List<Map<String, dynamic>>();
  List needCount = [0, 1, 2];
  var _selectedRegion = "";

  @override
  void initState() {
    super.initState();

    getStringFromSharedPrefs("region").then((value) {
      if (value != null) {
        _selectedRegion = value;
      }
    });

    getAllTours().then((value) {
      setState(() {
        allTours = value;
      });
    });

    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  Future<Null> refreshData() async {
    getStringFromSharedPrefs("region").then((value) {
      if (value != null) {
        _selectedRegion = value;
      }
    });

    await Future.delayed(Duration(seconds: 1));
    getAllTours().then((value) {
      setState(() {
        allTours = value;
      });
    });
  }

  String regionGenerate(regionText) {
    if (regionText == "Анапа") {
      return "Анапе";
    } else if (regionText == "Туапсе") {
      return regionText;
    } else if (regionText == "Сочи") {
      return "Сочи";
    } else {
      return regionText + "е";
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget mainTourCard(BuildContext context, int element_id) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TourWidget(
                        id: int.parse(allTours[element_id]['id']));
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
              width: m_ScreenSize.width * .90,
              height: m_ScreenSize.height * .60,
              decoration: BoxDecoration(
                color:  Colors.black,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: NetworkImage(allTours[element_id]['url_path']),
                  fit: BoxFit.cover,
                ),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left:20,right:20),
                    child: Flexible(
                      child: Text(
                          allTours[element_id]['name'],
                          style:TextStyle(
                            color: Colors.white,
                            fontSize:25,
                            fontWeight: FontWeight.bold,

                          ),

                      ),
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(left:20,right:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top:5),
                          child:Text(datetimeToString(allTours[element_id]['event_date']),style:TextStyle(color:Colors.white,fontSize:17,)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:15),
                          alignment: Alignment.center,
                          width:100,
                          height:35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(500,50,50,50),
                          ),
                          child: Text(allTours[element_id]['price'] + " ₽",style:TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:30),
                  Container(
                    padding: EdgeInsets.only(left:20,right: 20),
                    width: m_ScreenSize.width*.9,
                    alignment: Alignment.center,
                    child: FlatButton(
                        minWidth: m_ScreenSize.width * 6,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(color: Colors.white,width: 1),
                        ),
                        color: Color.fromARGB(0,255,105,0),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TourWidget(
                                    id: int.parse(allTours[element_id]['id']));
                              },
                            ),
                          );
                        },
                        child: Text("Подробнее",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16,)),
                    ),
                  ),
                  SizedBox(height:15),
                ],
              ),
              ),

    );
  }

  Widget smallTourCard(BuildContext context, int element_id) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return int.parse(allTours[element_id]['purchased_seats']) <
            int.parse(allTours[element_id]['seats_count'])
        ? FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            minWidth: m_ScreenSize.width / 3,
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TourWidget(id: int.parse(allTours[element_id]['id']));
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                allTours[element_id]['promotion'] == "1"
                    ? ClipRect(
                        child: Container(
                          child: Banner(
                            message: "Акция",
                            location: BannerLocation.topEnd,
                            color: Colors.red[400],
                            child: Container(
                              margin: EdgeInsets.only(left: 0, right: 15),
                              width: m_ScreenSize.width * .35,
                              height: 155,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      allTours[element_id]['url_path']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: 0, right: 15),
                        width: m_ScreenSize.width * .35,
                        height: 155,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image:
                                NetworkImage(allTours[element_id]['url_path']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Container(
                  width: m_ScreenSize.width * .35,
                  margin: EdgeInsets.only(top: 10, bottom: 0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    allTours[element_id]['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.blue),
                      Text(
                        allTours[element_id]['location'],
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget bigTourCard(BuildContext context, int element_id) {
    var m_ScreenSize = MediaQuery.of(context).size;
    return int.parse(allTours[element_id]['purchased_seats']) <
            int.parse(allTours[element_id]['seats_count'])
        ? FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            minWidth: m_ScreenSize.width / 3,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TourWidget(id: int.parse(allTours[element_id]['id']));
              }));
            },
            child: allTours[element_id]['promotion'] == "1"
                ? ClipRect(
                    child: Banner(
                      message: "Акция",
                      location: BannerLocation.topEnd,
                      color: Colors.red[400],
                      child: Container(
                        margin: EdgeInsets.only(left: 0, right: 15),
                        width: 200,
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image:
                                NetworkImage(allTours[element_id]['url_path']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 0, right: 15),
                    width: 200,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                        image: NetworkImage(allTours[element_id]['url_path']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            allTours[element_id]['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            allTours[element_id]['price'] + ' RUB',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;
    List text = [1, 2, 3, 4];

    return allTours.isNotEmpty
        ? Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                  key: refreshKey,
                  onRefresh: () async {
                    await refreshData();
                  },
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                            alignment: Alignment.centerLeft,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 6.0),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                hintText: "Введите запрос",
                                hintStyle: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                        /*  Container(
                            width: m_ScreenSize.width,
                            height: m_ScreenSize.height * .35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/mainpagepicture.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: m_ScreenSize.height * .15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                            _selectedRegion != ""
                                                ? "Вы сейчас в " +
                                                    regionGenerate(_selectedRegion)
                                                : "Вы сейчас в Новороссийске",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Выберите подходящий тур",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: const Offset(0.0, 25.0),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SearchPage();
                                            }));
                                          },
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            width: m_ScreenSize.width * .85,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 8.0,
                                                  spreadRadius: 2.0,
                                                  offset: Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: FocusScope(
                                              node: new FocusScopeNode(),
                                              child: TextField(
                                                enabled: false,
                                                focusNode: FocusNode(),
                                                enableInteractiveSelection: false,
                                                keyboardType: TextInputType.phone,
                                                style:
                                                    TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(top: 14.0),
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.black,
                                                  ),
                                                  hintText:
                                                      "Поиск подходящего тура",
                                                  hintStyle: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                          SizedBox(
                            height: 30,
                          ),
                          /*
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: (m_ScreenSize.width -
                                            (m_ScreenSize.width * .90)) /
                                        2,
                                    top: 25,
                                    right: (m_ScreenSize.width -
                                            (m_ScreenSize.width * .90)) /
                                        2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Популярные туры",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                        padding: EdgeInsets.all(0),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SearchPage();
                                            }));
                                          },
                                          child: Text(
                                            "Смотреть все",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Row(
                                          children: <Widget>[
                                            for (var i = 0; i < 4; i++)
                                              smallTourCard(context,
                                                  rng.nextInt(allTours.length)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: (m_ScreenSize.width -
                                            (m_ScreenSize.width * .90)) /
                                        2,
                                    top: 25,
                                    right: (m_ScreenSize.width -
                                            (m_ScreenSize.width * .90)) /
                                        2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Новые туры",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                        padding: EdgeInsets.all(0),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onPressed: () {},
                                          child: Text(
                                            "Смотреть все",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Row(
                                          children: <Widget>[
                                            for (var i = 0; i < 4; i++)
                                              smallTourCard(context,
                                                  rng.nextInt(allTours.length)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: (m_ScreenSize.width -
                                              (m_ScreenSize.width * .90)) /
                                          2,
                                      top: 0),
                                  child: Container(
                                    child: Text(
                                      "Туры для вас",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Row(
                                          children: <Widget>[
                                            for (var i = 0; i < 4; i++)
                                              bigTourCard(context,
                                                  rng.nextInt(allTours.length)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),*/

                                    for (var i = 0; i < allTours.length; i++)
                                      if (allTours.length > 0 &&
                                          int.parse(allTours[i]['purchased_seats']) <
                                              int.parse(allTours[i]['seats_count']))
                                      mainTourCard(
                                        context,
                                        i,
                                      ),
                             ],
                          ),

                    
                  )),
            ),
          )
        : circularProgressBar();
  }
}
