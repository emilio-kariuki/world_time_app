import 'package:flutter/material.dart';
import "package:http/http.dart";
import "dart:convert";

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // make request
    Response response = await get(
        Uri.parse("https://worldtimeapi.org/api/timezone/Africa/Nairobi"));
    Map data = jsonDecode(response.body);
    // print(data);
    // get properties
    String datetime = data['utc_datetime'];
    // ignore: unused_local_variable
    String offset = data['utc_offset'];
    // ignore: avoid_print
    // print(datetime);
    // print(offset);
    // create a datetime object
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen"),
    );
  }
}
