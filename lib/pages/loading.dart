import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // make request
    http.Response response = await http
        .get(Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Nairobi"));
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['utc_datetime'];
    // ignore: unused_local_variable
    String offset = data['utc_offset'].substring(1, 3);
    // create a datetime object
    DateTime now = DateTime.parse(datetime);
    // ignore: avoid_print
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
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
