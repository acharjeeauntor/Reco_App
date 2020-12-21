import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:recoapp/index.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  var _suggestionTextFieldController = new TextEditingController();
  var _categoryController = TextEditingController();
  String selectCategory = "";
  List suggestionsList = ['auntor', "au", 'Oppo', 'Radmi'];
  List<String> category = ['Mobile', 'Tab', 'Electronic'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryDropdown(),
              SizedBox(
                height: 20,
              ),
              productInputField(),
              SizedBox(
                height: 20,
              ),
              searchButton(context)
            ],
          ),
        ),
      ),
    );
  }

  DropDownField categoryDropdown() {
    return DropDownField(
      controller: _categoryController,
      onValueChanged: (dynamic value) {
        _categoryController = value;
      },
      value: _categoryController.text,
      required: false,
      hintText: 'Choose a category',
      items: category,
      enabled: true,
      itemsVisibleInDropdown: 5,
    );
  }

  GestureDetector searchButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_categoryController.text);
        print(_suggestionTextFieldController.text);
        print("Search");
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: Text(
          "Search Product",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  AutoCompleteTextField productInputField() {
    return AutoCompleteTextField(
        clearOnSubmit: false,
        controller: _suggestionTextFieldController,
        style: TextStyle(color: Colors.black87, fontSize: 17.0),
        decoration: InputDecoration(
            hintText: 'Search Product Here....',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        itemSubmitted: (item) {
          _suggestionTextFieldController.text = item;
        },
        key: null,
        suggestions: suggestionsList,
        itemBuilder: (context, item) {
          return Container(
            padding: EdgeInsets.all(14.0),
            child: Row(
              children: [
                Text(
                  item,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
        itemSorter: (a, b) {
          return a.compareTo(b);
        },
        itemFilter: (item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        });
  }
}
