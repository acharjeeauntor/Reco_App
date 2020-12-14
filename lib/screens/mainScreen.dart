import 'package:flutter/material.dart';
import 'package:recoapp/index.dart';
import 'package:recoapp/widgets/resultCard.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ClipOval&ClipRRect Widget"),
        ),
        body: ListView(
          children: [ResultCard(), ResultCard()],
        ));
  }
}
