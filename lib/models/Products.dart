import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.product_name,
    this.product_image_url,
    this.price,
    this.rating,
    this.review,
    this.Product_url,
    this.website_name,
  });

  String product_name;
  String product_image_url;
  int price;
  int rating;
  int review;
  String Product_url;
  String website_name;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        product_name: json["product_name"],
        product_image_url: json["product_image_url"],
        price: json["price"],
        rating: json["rating"],
        review: json["review"],
        Product_url: json["Product_url"],
        website_name: json["website_name"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": product_name,
        "product_image_url": product_image_url,
        "price": price,
        "rating": rating,
        "review": review,
        "Product_url": Product_url,
        "website_name": website_name,
      };
}
