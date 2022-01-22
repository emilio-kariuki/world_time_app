import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // ignore: unused_local_variable
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // ignore: avoid_print
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen"),
    );
  }
}
