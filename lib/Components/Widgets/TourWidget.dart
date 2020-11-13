import 'package:flutter/material.dart';

class TourWidget extends StatefulWidget {
  _TourWidget createState() => _TourWidget();
}

class _TourWidget extends State<TourWidget> {
  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Дворцовое ожерелье Крыма",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: m_ScreenSize.width,
              height: m_ScreenSize.height * .35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.tildacdn.com/tild3335-6537-4836-b639-666630663138/livadia_1l.jpg'),
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
                        "Дворцовое ожерелье Крыма",
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
                        "Россия, Крымский п-ов",
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
                            "2500 / 1300 RUB",
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
                              child: Icon(Icons.favorite_outline_rounded,
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
                        "Загадочный, волшебный, изумительно красивый Крым многолик, недаром его называют «миром в миниатюре», ведь здесь есть все: степь и горы, зеленые долины и лечебные озера, заповедные леса и красивейшие парки, прекрасные дворцы, дворянские усадьбы и удивительные природные памятники, таинственные пещеры и памятники культуры давно исчезнувших народов, море с его пляжами и подводными пещерами.Ливадийский дворец в Крыму. Осмотрев сам дворец, можно будет побродить по окрестностям парка, окружающего его по всем сторонам. Тут посажено свыше 400 разновидностей экзотических растений, такой коллекции позавидует любой садовод. ... Ливадийский дворец — это невероятно красивое место, после посещения которого у вас останутся положительные впечатления. Ежегодно он привлекает туристов не только из Крыма, но и со всего мира, чему способствует приятный климат, прекрасная архитектура и парк с редкими растениями«Ласточкино гнездо» (смотровая площадка) – средневековый замок из серого камня в готическом стиле с изящными башенками, выстроенный на отвесной Аврориной скале, которая находится в Гаспре – поселке на мысе Ай-Тодор. Это одна из самых высоких скал Южного побережья Крымского полуострова – высота ее 40 м. Сегодня замок находится в статусе архитектурного и исторического памятника, он – эмблема южного побережья Крыма.Дворец «Дюльбер» -восточная сказка в Крыму. Поражает воображение и приковывает к себе внимание с первого взгляда. Белоснежное здание с серебристыми куполами, башенками, зубчатыми стенами резко выделяется на фоне Главной гряды Крымских гор.Массандровский дворец в Крыму – один из лучших памятников древней архитектуры, который, несмотря на свой солидный возраст, остается привлекательным и по сей день. Изначально он не принадлежал царской семье Романовых – в XIX столетии мысль о строительстве необычного дворца посетила князя Воронцова. Желая иметь собственное имение, возведенное в модном французском стиле «Возрождение», он заказал проект строительства дворца, названного впоследствии Массандровским.Массандровский дворец колоритен сам по себе. ",
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
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(color: Colors.transparent)),
                      minWidth: m_ScreenSize.width * .95,
                      height: 60,
                      color: Color.fromARGB(500, 0, 140, 255),
                      onPressed: () {},
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
    );
  }
}
