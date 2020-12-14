import 'package:flutter/material.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
     child:Column(
       children: [
         DropdownButton(items: null, onChanged: null),
         TextFormField(

         ),
         RaisedButton(onPressed: null)

       ],
     ) ,
      elevation: 5.6,
    );
  }
}
