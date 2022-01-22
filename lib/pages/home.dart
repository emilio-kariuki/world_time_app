// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import "loading.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Object? data = ModalRoute.of(context)?.settings.arguments;
    // ignore: avoid_print
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location")),
          )
        ],
      )),
    );
  }
}
