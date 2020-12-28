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
    } catch (error) {
      throw error;
    }
  }
}
