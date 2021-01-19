import 'package:flutter/material.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/widgets/searchcard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Searchcard()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/logoNew.png",
            height: 80,
            width: 80,
          ),
          Center(child: Searchcard())
        ],
      ),
    );
  }
}
