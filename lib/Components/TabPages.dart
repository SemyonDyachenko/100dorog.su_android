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
          m_icon: Icon(Icons.home),
          m_title: 'Главная',
        ),
        TabNavigationItem(
          m_page: SearchPage(),
          m_icon: Icon(
            Icons.search,
          ),
          m_title: "Поиск",
        ),
        TabNavigationItem(
          m_page: MailPage(),
          m_icon: Icon(
            Icons.notifications,
          ),
          m_title: "Почта",
        ),
        TabNavigationItem(
          m_page: ProfilePage(),
          m_icon: Icon(
            Icons.account_circle,
          ),
          m_title: "Профиль",
        ),
      ];
}

class TabsPage extends StatefulWidget {
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
        selectedFontSize: 15,
        unselectedFontSize: 13,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(200, 0, 140, 255), size: 30),
        unselectedIconTheme: IconThemeData(color: Colors.black, size: 28),
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        showUnselectedLabels: false,
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
