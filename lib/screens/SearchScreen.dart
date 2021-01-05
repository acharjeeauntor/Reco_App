import 'package:flutter/material.dart';
import 'package:reco_app/widgets/searchcard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Searchcard()),
    );
  }
}
