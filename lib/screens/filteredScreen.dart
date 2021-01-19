import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/providers/appData.dart';

import 'ConnectionLostScreen.dart';

class FilteredScreen extends StatefulWidget {
  @override
  _FilteredScreenState createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  int price = 1000;
  var rating = 0;
  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
//          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 15, right: 20),
              child: Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                price = 1000;
                rating = 0;
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text('Max: $price'),
                      margin: EdgeInsets.only(left: 17),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.blue[300],
                        inactiveTrackColor: Colors.blue[100],
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 4.0,
                        thumbColor: Colors.blue,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: Colors.blue.withAlpha(22),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                        min: 1000,
                        divisions: 1000,
                        max: 100000,
                        value: price.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            price = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rating",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text('Selected: $rating+'),
                      margin: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ratting(context, Colors.redAccent, 0),
                        ratting(context, Colors.green, 3),
                        ratting(context, Colors.deepOrangeAccent, 5),
                        ratting(context, Colors.orangeAccent, 7),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () async {
                var connectivityResult =
                    await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.mobile ||
                    connectivityResult == ConnectivityResult.wifi) {
                  appDataProvider.fetchProductsByFilter(
                      appDataProvider.productName,
                      price.toString(),
                      rating.toString(),
                      appDataProvider.getCategory);
                  if (appDataProvider.serverError) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnectionLostScreen()));
                  }
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnectionLostScreen()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Show Results",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ratting(BuildContext context, Color color, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rating = value;
        });
        print(rating);
      },
      child: Container(
        height: 32,
        width: 35,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Center(
            child: Text(
          '$value+',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
