import 'package:flutter/material.dart';
import 'package:recoapp/index.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton(items: null, onChanged: null),
            TextFormField(),
            RaisedButton(
              textColor: Colors.white,
              elevation: 5,
              color: Colors.green,
              onPressed: () {
                print("Search");
              },
              child: Text(
                "Search Product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
