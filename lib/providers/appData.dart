import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recoapp/models/Category.dart';
import 'package:recoapp/models/HintProduct.dart';
import 'package:recoapp/models/Products.dart';

class AppData with ChangeNotifier {
  var productName = '';
  //var productCategory = '';

  List<Products> _productsList = [];
  List<String> _categoryList = [];
  List<String> _hintProductsList = [];

  // search [post] product by product name & category and add them on our local List
  Future<void> fetchProducts({String pName, String category}) async {
    try {
      final response = await http.post("http://10.0.2.2:5000/search",
          body: {"name": pName, "ctg": category});
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _productsList.clear();
        //notify income list widget
        for (var data in responseData) {
          _productsList.add(Products.fromJson(data));
          notifyListeners();
        }
      } else if (response.statusCode == 400) {
        print("Server Error");
      }
    } catch (error) {
      throw error;
    }
  }

  //Access [get] search Products List Format
  List<Products> get productsList {
    print("productsList call $_productsList");
    return [..._productsList];
  }

  // Add [post] Product name on result page
  Future<void> addProductName(String name) {
    productName = name;
    notifyListeners();
  }

  // show [get] product name
  String get searchProductName => productName;

  //get all category from server side or database and add them on our local List
  Future<void> fetchCategory() async {
    print("fetchCategory work");
    try {
      final response = await http.get("http://10.0.2.2:5000/catagory");
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _categoryList.clear();
        if (responseData == null) {
          return;
        } else {
          for (var data in responseData) {
            _categoryList.add(Category.fromJson(data).categoryname);
            notifyListeners();
          }
        }
      } else if (response.statusCode == 400) {
        print("Server Error");
      }
    } catch (error) {
      throw error;
    }
  }

  //Access [get] Category List Format
  List<String> get categoryList {
    return [..._categoryList];
  }

  //get all product for hint and add them on our local List
  Future<void> fetchProductForHint(String category) async {
    try {
      final response = await http.post(
          "http://10.0.2.2:5000/search/category/product",
          body: {"ctg": category.toString()});
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _hintProductsList.clear();
        if (responseData == null) {
          print("Null");
          return;
        } else {
          for (var data in responseData) {
            print("Data $data");

            _hintProductsList
                .add(HintProduct.fromJson(data).itemName.toString());
            notifyListeners();
          }
        }
      } else if (response.statusCode == 400) {
        print("Server Error");
      }
    } catch (error) {
      throw error;
    }
  }

  //Access [get] Hint Product on List Format
  List<String> get hintProductsList {
    return [..._hintProductsList];
  }

  //Product List for typeahead pattern
  fetchProductFromPattern(String word) {
//    print("hint");
//    print(_hintProductsList);
    List<String> patternProduct = [];
    for (String item in _hintProductsList) {
      //print("item $item");
      if (item.contains(word)) {
        patternProduct.add(item);
      }
    }
    return patternProduct;
  }
}
