// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import "loading.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // ignore: avoid_print
    print(data);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
        child: SafeArea(
            child: Column(
          children: [
            Center(
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ))
              ],
            ),
            SizedBox(height: 20),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66
              )),
          ],
        )),
      ),
    );
  }
}
