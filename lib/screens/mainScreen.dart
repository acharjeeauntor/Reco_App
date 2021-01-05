import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/providers/appData.dart';
import 'package:url_launcher/url_launcher.dart';

import 'filteredScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  String sortType = '';
  int selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: false);

    void _pressedSortButton() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Color(0xFF737373),
              height: 180,
              child: Container(
                child: navigatorColumn(context, appDataProvider),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10))),
              ),
            );
          });
    }

    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(0.6)),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                Positioned(
                  top: 15,
                  right: 160,
                  child: Text(
                    appDataProvider.searchProductName,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilteredScreen()),
                            );
                          },
                          icon: Icon(Icons.wrap_text),
                          label: Text('Filter',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20))),
                      FlatButton.icon(
                          onPressed: () => _pressedSortButton(),
                          icon: Icon(Icons.sort),
                          label: Text('Sort',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Consumer<AppData>(
          builder: (context, products, ch) {
            return Expanded(
              child: products.productsList.length == 0
                  ? Center(child: Text("No Product Found"))
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: products.productsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => null,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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
                                          products
                                              .productsList[index].siteImageUrl,
                                          height: 250,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )),
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
                                          products.productsList[index].itemName,
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
                                          products.productsList[index].site,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.green),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 1),
                                        child: Text(
                                          products.productsList[index].rating
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 35,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 1),
                                        child: Text(
                                          "5 reviews",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "${products.productsList[index].price} BDT",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          launchURL(products
                                              .productsList[index].productUrl);
                                        },
                                        child: Row(
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
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            );
          },
        )
      ],
    ));
  }

  Column navigatorColumn(BuildContext context, AppData appData) {
    return Column(
      children: [
        ListTile(
          onTap: () => {
            setState(() {
              selectedRadio = 1;
              sortType = 'ourrecommendations';
              appData.fetchProducts(
                  pName: appData.productName, category: appData.getCategory);
              Navigator.pop(context);
            })
          },
          title: const Text('Our Recommendations'),
          leading: Radio(
            onChanged: (val) {
              appData.fetchProducts(
                  pName: appData.productName, category: appData.getCategory);
            },
            activeColor: Colors.blueAccent,
            value: 1,
            groupValue: selectedRadio,
          ),
        ),
        ListTile(
          onTap: () => {
            setState(() {
              selectedRadio = 2;
              sortType = 'price';
              appData.sortProductByPrice(
                  appData.productName, appData.getCategory);
              Navigator.pop(context);
            })
          },
          title: const Text('Price Only'),
          leading: Radio(
            onChanged: (val) {
              appData.sortProductByPrice(
                  appData.productName, appData.getCategory);
            },
            activeColor: Colors.blueAccent,
            value: 2,
            groupValue: selectedRadio,
          ),
        ),
        ListTile(
          onTap: () => {
            setState(() {
              selectedRadio = 3;
              sortType = 'rating';
              appData.sortProductByRating(
                  appData.productName, appData.getCategory);
              Navigator.pop(context);
            })
          },
          title: const Text('Rating Only'),
          leading: Radio(
            activeColor: Colors.blueAccent,
            value: 3,
            groupValue: selectedRadio,
            onChanged: (val) {
              appData.sortProductByRating(
                  appData.productName, appData.getCategory);
            },
          ),
        ),
      ],
    );
  }

  void launchURL(String url) async {
    print("Url call");
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
