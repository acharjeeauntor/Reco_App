import 'dart:convert';

List<HintProduct> hintProductFromJson(String str) => List<HintProduct>.from(
    json.decode(str).map((x) => HintProduct.fromJson(x)));

String hintProductToJson(List<HintProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HintProduct {
  HintProduct({
    this.product_name,
  });

  String product_name;

  factory HintProduct.fromJson(Map<String, dynamic> json) => HintProduct(
        product_name: json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": product_name,
      };
}
