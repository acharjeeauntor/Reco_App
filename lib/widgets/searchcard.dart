import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:recoapp/index.dart';
import 'package:recoapp/providers/appData.dart';
import 'package:recoapp/screens/mainScreen.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  TextEditingController _categoryController = new TextEditingController();
  TextEditingController _productController = new TextEditingController();

  String _selectProduct = "";

  @override
  Widget build(BuildContext context) {
    //final appDataProvider = Provider.of<AppData>(context, listen: false);
    return Consumer<AppData>(
      builder: (context, appData, ch) {
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
                  categoryDropdown(appData),
                  SizedBox(
                    height: 20,
                  ),
                  TypeAheadField(
                    hideOnEmpty: true,
                    getImmediateSuggestions: true,
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: _productController,
                        autofocus: true,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.italic),
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      //print("pattern $pattern");
                      return appData.fetchProductFromPattern(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: GestureDetector(
                          child: Text(suggestion),
                        ),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      _productController.text = suggestion;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  searchButton(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DropDownField categoryDropdown(AppData appData) {
    //print(appDataProvider.categoryList.length);
    return DropDownField(
      controller: _categoryController,
      onValueChanged: (dynamic value) {
        appData.fetchProductForHint(value);
        //suggestionsList = [...appDataProvider.hintProductsList];

        _categoryController = value;
      },
      value: _categoryController.text,
      required: false,
      hintText: 'Choose a category',
      items: appData.categoryList,
      enabled: true,
      itemsVisibleInDropdown: appData.categoryList.length,
    );
  }

  GestureDetector searchButton(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    return GestureDetector(
      onTap: () {
        appDataProvider.fetchProducts(
            pName: _productController.text, category: _categoryController.text);
        appDataProvider.addProductName(_productController.text);
//        print(_categoryController.text);
//        print(_suggestionTextFieldController.text);
        _categoryController.clear();
        _productController.text = "";

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
}
