import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:recoapp/index.dart';
import 'package:recoapp/widgets/dashboardnavigation.dart';

class InternetConnectionCheck extends StatefulWidget {
  @override
  _InternetConnectionCheckState createState() =>
      _InternetConnectionCheckState();
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  checkStatus() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardNavigation()));
      } else {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text.rich(
              TextSpan(
                // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: 'Best',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Product',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent)),
                ],
              ),
            ),
            Image.asset('assets/images/nointernet.gif'),
            Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            )
          ]),
        );
      }
    });
  }
}
