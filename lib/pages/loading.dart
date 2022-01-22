import 'package:flutter/material.dart';
import "package:world_time_app/services/world_time.dart";

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String text = "Loading";
  void setUpWorldTime() async {
    WorldTime obj = WorldTime(
        location: "Nairobi", flag: "nairobi.png", url: "Africa/Nairobi");
    await obj.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": obj.location,
      "flag" : obj.flag,
      "time" : obj.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(text)),
    );
  }
}
