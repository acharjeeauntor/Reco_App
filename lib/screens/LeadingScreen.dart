import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/providers/appData.dart';
import 'package:reco_app/screens/ConnectionLostScreen.dart';
import 'package:reco_app/widgets/dashboardnavigation.dart';

class LeadingScreen extends StatefulWidget {
  @override
  _LeadingScreenState createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context, listen: false);
    Timer(Duration(seconds: 3), () async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        appDataProvider.fetchProductForHint();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardNavigation()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ConnectionLostScreen()));
      }
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logoNew.png",
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
