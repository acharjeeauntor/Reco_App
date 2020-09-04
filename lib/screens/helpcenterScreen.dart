import 'package:flutter/material.dart';
import 'package:recoapp/index.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help Center'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome To Our Help Center',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  print("search");
                                },
                                icon: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              hintText: 'What do you need help with?',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        print("add");
                      },
                      icon: Icon(Icons.add),
                    ),
                    title: Text('How do i search for best products.'),
                  ),

              ),
            ],
          ),
        ));
  }
}
