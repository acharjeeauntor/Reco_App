import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/screens/ErrorScreen.dart';
import 'package:reco_app/widgets/dashboardnavigation.dart';

class InternetConnectionCheck extends StatefulWidget {
  @override
  _InternetConnectionCheckState createState() =>
      _InternetConnectionCheckState();
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
  // @override
  // void initState() {
  //   checkStatus();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    bool checkStatus() {
      Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          return true;
        } else {
          return false;
        }
      });
    }

    return Scaffold(
      body: checkStatus == true ? DashboardNavigation() : ErrorScreen(),
    );
  }
}
