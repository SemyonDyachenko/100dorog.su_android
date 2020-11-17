import 'package:flutter/material.dart';

class RegionSettings extends StatefulWidget {
  _RegionSettings createState() => _RegionSettings();
}

class _RegionSettings extends State<RegionSettings> {
  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;
    List text = [1, 2, 3, 4, 5, 6];
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
            Text("Регион", style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 15),
              alignment: Alignment.centerLeft,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Введите название региона или города",
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            for (var i in text)
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Container(
                      width: m_ScreenSize.width,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Абинск",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              )),
                          SizedBox(height: 3),
                          Text("г. Абинск, Краснодарский край, Россия",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              )),
                          SizedBox(height: 7),
                          Container(
                            width: m_ScreenSize.width,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        ],
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
