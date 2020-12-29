import 'dart:convert';

List<HintProduct> hintProductFromJson(String str) => List<HintProduct>.from(
    json.decode(str).map((x) => HintProduct.fromJson(x)));

String hintProductToJson(List<HintProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HintProduct {
  HintProduct({
    this.itemName,
  });

  String itemName;

  factory HintProduct.fromJson(Map<String, dynamic> json) => HintProduct(
        itemName: json["item_name"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
      };
}
