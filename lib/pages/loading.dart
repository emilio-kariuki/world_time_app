import 'package:flutter/material.dart';
import "package:world_time_app/services/world_time.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      "isDayTime" : obj.isDayTime,
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
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
