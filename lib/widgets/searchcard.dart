import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/providers/appData.dart';
import 'package:reco_app/screens/ConnectionLostScreen.dart';
import 'package:reco_app/screens/mainScreen.dart';

class Searchcard extends StatefulWidget {
  @override
  _SearchcardState createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  TextEditingController _productController = new TextEditingController();

  //String _selectProduct = "";

  @override
  Widget build(BuildContext context) {
    //final appDataProvider = Provider.of<AppData>(context, listen: false);
    return Consumer<AppData>(
      builder: (context, appData, ch) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.22,
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
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TypeAheadField(
                    hideOnEmpty: true,
                    getImmediateSuggestions: true,
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: _productController,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.italic),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Product Name")),
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

  GestureDetector searchButton(BuildContext context) {
    // checkStatus() {
    //   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //     if (result == ConnectivityResult.mobile ||
    //         result == ConnectivityResult.wifi) {
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   });
    // }

    final appDataProvider = Provider.of<AppData>(context, listen: false);
    return GestureDetector(
      onTap: () async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          if (_productController.text.isEmpty) {
            Fluttertoast.showToast(
                msg: "Product Name Required",
                toastLength: Toast.LENGTH_LONG,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            appDataProvider.fetchProducts(pName: _productController.text);
            appDataProvider.addProductName(_productController.text);
            if (appDataProvider.serverError) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConnectionLostScreen()));
            }

//        print(_categoryController.text);
//        print(_suggestionTextFieldController.text);
            _productController.text = "";

            print("Search");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ConnectionLostScreen()));
        }
      },
      child: Container(
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
