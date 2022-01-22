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
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(data);

    // setting background

    // ignore: unused_local_variable
    String bgImage = data['isDayTime'] ? "day.png" : "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              Center(
                child: FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "location":result["location"],
                          "flag" : result["flag"],
                          "time" : result["time"],
                          "isDayTime" :result["isDayTime"],

                        };
                      });
                    },
                    icon: Icon(Icons.edit_location,
                        color: Colors.grey[300], size: 10),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        // fontSize: 10,
                        color: Colors.grey[300],
                      ),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data["location"],
                      style: TextStyle(
                        fontSize: 28,
                        // fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(height: 10),
              Text(data['time'],
                  style: TextStyle(fontSize: 66, color: Colors.white)),
            ],
          )),
        ),
      ),
    );
  }
}
