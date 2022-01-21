import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_loacation.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes:{
      "/home":(context) => Home(),
      "/loading": (context) => Loading(),
      "/choose_loaction": (context) => ChooseLocation(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
