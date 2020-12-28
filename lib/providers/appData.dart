import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recoapp/providers/Products.dart';

class AppData with ChangeNotifier {
  var productName = '';
  var productCategory = '';

  List<Products> _productsList = [];
  List _categoryList = [];
  List _hintProductsList = [];

  Future<void> fetchProducts({String pName, String category}) async {
    try {
      final response = await http.post("http://10.0.2.2:5000/search",
          body: {"name": pName, "ctg": category});
      var responseData = json.decode(response.body);
      //print(responseData);
      // print("addncome called");
      if (response.statusCode == 200) {
        //notify income list widget
        _productsList.add(Products.fromJson(responseData));
        notifyListeners();
      } else if (response.statusCode == 400) {
        print("Server Error");
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProductName(String name) {
    productName = name;
    notifyListeners();
  }

  String get searchProductName => productName;

  List<Products> get productsList {
    return [..._productsList];
  }
}
