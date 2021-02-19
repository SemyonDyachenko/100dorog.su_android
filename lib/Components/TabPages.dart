import 'package:travel/Components/MailPage.dart';
import 'package:travel/Components/MainPage.dart';
import 'package:travel/Components/ToursPage.dart';
import 'package:travel/Components/SearchPage.dart';
import 'package:travel/Components/ProfilePage.dart';

import 'package:flutter/material.dart';

class TabNavigationItem {
  final Widget m_page;
  final String m_title;
  final Icon m_icon;

  TabNavigationItem({
    @required this.m_page,
    @required this.m_title,
    @required this.m_icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          m_page: MainPage(),
          m_icon: Icon(Icons.explore_outlined),
          m_title: 'Главная',
        ),
       /* TabNavigationItem(
          m_page: SearchPage(),
          m_icon: Icon(
            Icons.search_outlined,
          ),
          m_title: "Поиск",
        ),*/
        TabNavigationItem(
          m_page: MailPage(),
          m_icon: Icon(
            Icons.notifications_outlined,
          ),
          m_title: "Почта",
        ),
        TabNavigationItem(
          m_page: ProfilePage(),
          m_icon: Icon(
            Icons.account_circle_outlined,
          ),
          m_title: "Профиль",
        ),
      ];
}

class TabsPage extends StatefulWidget {
  final int index;

  const TabsPage({Key key, @required this.index}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final item in TabNavigationItem.items) item.m_page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Color.fromARGB(500, 0, 132, 255),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(500, 0, 132, 255), size: 22),
        unselectedIconTheme: IconThemeData(color: Colors.black, size: 22),
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        showUnselectedLabels: true,
        items: [
          for (final item in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: item.m_icon,
              label: item.m_title,
            )
        ],
      ),
    );
  }
}
