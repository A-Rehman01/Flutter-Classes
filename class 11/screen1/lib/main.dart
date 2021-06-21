import 'package:flutter/material.dart';
import 'package:screen1/customAppBar.dart';

import 'movies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBarWidget('Movies'),
        body: Movies(),
        ),
    );
  }
}