import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recoapp/index.dart';
import 'package:recoapp/providers/appData.dart';
import 'package:recoapp/widgets/resultCard.dart';

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
                child: navigatorColumn(context),
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
        Icon(Icons.arrow_back),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    appDataProvider.searchProductName,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilteredScreen()),
                            );
                          },
                          icon: Icon(Icons.ac_unit),
                          label: Text('Filter',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20))),
                      FlatButton.icon(
                          onPressed: () => _pressedSortButton(),
                          icon: Icon(Icons.ac_unit),
                          label: Text('Sort',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Consumer<AppData>(
          builder: (context, products, ch) {
            return Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: products.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ResultCard({
                      products.productsList[index].siteImageUrl,
                      products.productsList[index].itemName,
                      products.productsList[index].productUrl,
                      products.productsList[index].site,
                      products.productsList[index].price.toString(),
                      products.productsList[index].rating.toString()
                    });
                  }),
            );
          },
        )
      ],
    ));
  }

  Column navigatorColumn(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => {
            setState(() {
              selectedRadio = 1;
              sortType = 'ourrecommendations';
              print(sortType);
              Navigator.pop(context);
            })
          },
          title: const Text('Our Recommendations'),
          leading: Radio(
            onChanged: (val) {},
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
              print(sortType);
              Navigator.pop(context);
            })
          },
          title: const Text('Price Only'),
          leading: Radio(
            onChanged: (val) {},
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
              print(sortType);
              Navigator.pop(context);
            })
          },
          title: const Text('Rating Only'),
          leading: Radio(
            activeColor: Colors.blueAccent,
            value: 3,
            groupValue: selectedRadio,
            onChanged: (val) {},
          ),
        ),
      ],
    );
  }
}
