import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recoapp/index.dart';
import 'package:recoapp/providers/appData.dart';
import 'package:recoapp/screens/mainScreen.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  TextEditingController _suggestionTextFieldController =
      new TextEditingController();
  TextEditingController _categoryController = new TextEditingController();

  //String selectCategory = "";
  //List<String> suggestionsList1 = ['auntor', "au", 'Oppo', 'Radmi'];
  //List<String> suggestionsList;
  //List<String> category = ['Mobile', 'Tab', 'Electronic'];

  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: true);
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
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
              categoryDropdown(appDataProvider),
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

  DropDownField categoryDropdown(AppData appDataProvider) {
    //print(appDataProvider.categoryList.length);
    return DropDownField(
      controller: _categoryController,
      onValueChanged: (dynamic value) {
        appDataProvider.fetchProductForHint(value);
        //suggestionsList = appDataProvider.hintProductsList;
        //print(suggestionsList);
        _categoryController = value;
      },
      value: _categoryController.text,
      required: false,
      hintText: 'Choose a category',
      items: appDataProvider.categoryList,
      enabled: true,
      itemsVisibleInDropdown: appDataProvider.categoryList.length,
    );
  }

  GestureDetector searchButton(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    return GestureDetector(
      onTap: () {
        appDataProvider.fetchProducts(
            pName: _suggestionTextFieldController.text,
            category: _categoryController.text);
        appDataProvider.addProductName(_suggestionTextFieldController.text);
//        print(_categoryController.text);
//        print(_suggestionTextFieldController.text);
        _categoryController.clear();
        _suggestionTextFieldController.clear();

        print("Search");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
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
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    print("productInputField ${appDataProvider.hintProductsList}");
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
        suggestions: [...appDataProvider.hintProductsList],
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
