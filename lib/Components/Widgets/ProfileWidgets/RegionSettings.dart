import 'package:flutter/material.dart';
import 'package:travel/api/auth/preferences.dart';
import 'package:travel/api/regions/regions_services.dart';
import 'package:travel/utils/CircularProgressBar.dart';

class RegionSettings extends StatefulWidget {
  _RegionSettings createState() => _RegionSettings();
}

class _RegionSettings extends State<RegionSettings> {
  GlobalKey<RefreshIndicatorState> refreshKey;
  List<Map<String, dynamic>> _regions = List<Map<String, dynamic>>();
  var _selectedRegion = "";

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();

    getStringFromSharedPrefs("region").then((value) {
      setState(() {
        if (value != null) {
          _selectedRegion = value;
        }
      });
    });

    getAllRegions().then((value) {
      setState(() {
        _regions = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    getStringFromSharedPrefs("region").then((value) {
      setState(() {
        if (value != null) {
          _selectedRegion = value;
        }
      });
    });
    getAllRegions().then((value) {
      setState(() {
        _regions = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var m_ScreenSize = MediaQuery.of(context).size;

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
      body: RefreshIndicator(
        onRefresh: () async {
          await refreshData();
        },
        key: refreshKey,
        child: SingleChildScrollView(
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
                          Text("Не выбрано",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              )),
                          SizedBox(height: 3),
                          Text(" ",
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
              for (var i = 0; i < _regions.length; i++)
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    addStringValueToSharedPrefs("region", _regions[i]['name']);
                    getStringFromSharedPrefs("region").then((value) {
                      if (value != null) {
                        Navigator.pop(context);
                      } else {}
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: m_ScreenSize.width,
                        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _selectedRegion == _regions[i]['name']
                                ? Text(_regions[i]['name'].toString(),
                                    style: TextStyle(
                                      color: Colors.green[300],
                                      fontSize: 16,
                                    ))
                                : Text(_regions[i]['name'].toString(),
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    )),
                            SizedBox(height: 3),
                            Text("Краснодарский край, Россия",
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
