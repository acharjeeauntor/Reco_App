import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.itemName,
    this.categoryname,
    this.price,
    this.rating,
    this.productUrl,
    this.site,
  });

  String itemName;
  String categoryname;
  int price;
  int rating;
  String productUrl;
  String site;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        itemName: json["item_name"],
        categoryname: json["categoryname"],
        price: json["price"],
        rating: json["rating"],
        productUrl: json["Product_url"],
        site: json["site"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "categoryname": categoryname,
        "price": price,
        "rating": rating,
        "Product_url": productUrl,
        "site": site,
      };
}
