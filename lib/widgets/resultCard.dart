import 'package:flutter/material.dart';
import 'package:reco_app/index.dart';

class ResultCard extends StatefulWidget {
  String imageUrl = '';
  String productName = "";
  String productUrl = "";
  String websiteName = "";
  double price;
  double rating;
  int review = 12;

  ResultCard(this.imageUrl, this.productName, this.productUrl, this.websiteName,
      this.price, this.rating, this.review);

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 35,
                  right: 25,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 25,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      "Daraz.com",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210,
                  right: 310,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Text(
                      "5",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210,
                  right: 240,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Text(
                      "5 reviews",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "100 BDT",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'View Deal',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
