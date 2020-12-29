import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recoapp/providers/appData.dart';
import 'package:recoapp/screens/SearchScreen.dart';
import 'package:recoapp/screens/settingsScreen.dart';

class DashboardNavigation extends StatefulWidget {
  static const routeName = 'dashboardnavigation';

  @override
  _DashboardNavigationState createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    appDataProvider.fetchCategory();
    print("fetchCategory work");
  }

  final List<Map<String, Object>> _pages = [
    {'page': SearchScreen(), 'title': 'Search'},
    {'page': SettingsScreen(), 'title': 'Settings'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          backgroundColor: const Color(0xffD7DBDD),
          elevation: 15.0,
          selectedItemColor: Colors.pink,
          selectedFontSize: 15,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), title: const Text('Search')),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), title: const Text('Setting'))
          ]),
    );
  }
}
