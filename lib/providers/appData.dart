import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reco_app/models/HintProduct.dart';
import 'package:reco_app/models/Products.dart';

class AppData with ChangeNotifier {
  var productName = '';
  bool isLoading = true;
  bool isError = false;

  List<Products> _productsList = [];
  List<Products> _oldProductsList = [];
  List<String> _hintProductsList = [];

  //Set isLoading With true or false
  bool get indicator => isLoading;

  bool get serverError => isError;

  void clearLists() {
    _productsList.clear();
    _oldProductsList.clear();
    productName = ' ';
  }

  // search [post] product by product name & category and add them on our local List
  Future<void> fetchProducts({String pName}) async {
    try {
      final response =
          await http.post("http://10.0.2.2:5000/search", body: {"name": pName});
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _productsList.clear();
        _oldProductsList.clear();
        //notify income list widget
        for (var data in responseData) {
          _productsList.add(Products.fromJson(data));
          _oldProductsList.add(Products.fromJson(data));
        }
        isLoading = false;
        notifyListeners();
      } else if (response.statusCode == 400) {
        isError = true;
      }
    } catch (error) {
      throw error;
    }
  }

  void filterProduct(String productPrice, String productRating) {
    List<Products> filteredProduct = _oldProductsList
        .where((element) =>
            (element.price <= int.parse(productPrice)) &&
            (element.rating >= int.parse(productRating)))
        .toList();
    print("filtered $filteredProduct");
    _productsList.clear();
    _productsList.addAll(filteredProduct);
    filteredProduct.clear();
    print("ProductList $_productsList");
    notifyListeners();
  }

  // sort product by rating and add them on our local List
  void sortProductByRating() {
    // print("SortByRating: $_productsList");
    Comparator<Products> sortByRating = (a, b) => b.rating.compareTo(a.rating);
    _productsList.sort(sortByRating);
    notifyListeners();
  }

  void ourRecommanded() {
    // print("Our recoman: $_productsList");
    _productsList.clear();
    _productsList.addAll(_oldProductsList);
    notifyListeners();
  }

  // sort product by price and add them on our local List
  void sortProductByPrice() {
    // print("SortByPrice: $_productsList");
    Comparator<Products> sortByPrice = (a, b) => a.price.compareTo(b.price);
    _productsList.sort(sortByPrice);
    notifyListeners();
  }

  //Access [get] search Products List Format
  List<Products> get productsList {
//    print("productsList call $_productsList");
    return [..._productsList];
  }

  // Add [post] Product name on result page
  Future<void> addProductName(String name) {
    productName = name;
    notifyListeners();
  }

  // show [get] product name
  String get searchProductName => productName;

  //get all product for hint and add them on our local List
  Future<void> fetchProductForHint() async {
    try {
      final response = await http.get("http://10.0.2.2:5000/product");
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
                .add(HintProduct.fromJson(data).product_name.toString());
          }
          notifyListeners();
        }
      } else if (response.statusCode == 400) {
        isError = true;
      }
    } catch (error) {
      throw error;
    }
  }

  // //Access [get] Hint Product on List Format
  // List<String> get hintProductsList {
  //   return [..._hintProductsList];
  // }

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

  // Insert Feedback
  Future<String> insertFeedback({String email, String feedback}) async {
    final response = await http.post("http://10.0.2.2:5000/feedback",
        body: {"email": email, "message": feedback});
    // var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      return "Feedback Send";
    } else if (response.statusCode == 400) {
      return "Server Error";
    }
  }
}
