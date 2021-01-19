import 'package:flutter/material.dart';
import 'package:reco_app/index.dart';

class InternetConnectionCheck extends StatefulWidget {
  @override
  _InternetConnectionCheckState createState() =>
      _InternetConnectionCheckState();
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result != ConnectivityResult.mobile ||
    //       result != ConnectivityResult.wifi) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => ErrorScreen()));
    //   } else {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => DashboardNavigation()));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logoNew.png",
          fit: BoxFit.fill,
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
