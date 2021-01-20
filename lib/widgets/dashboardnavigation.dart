import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/providers/appData.dart';
import 'package:reco_app/screens/SearchScreen.dart';
import 'package:reco_app/screens/settingsScreen.dart';

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
    Timer.run(() {
      final appDataProvider = Provider.of<AppData>(context, listen: false);
      appDataProvider.fetchProductForHint();
    });
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
                // ignore: deprecated_member_use
                icon: const Icon(Icons.search),
                title: const Text('Search')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: const Icon(Icons.settings),
                title: const Text('Setting'))
          ]),
    );
  }
}
