import 'package:flutter/material.dart';

import 'api.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OO",
      home: Scaffold(
        body: APIINTEGERATION(),
        appBar: AppBar(title: Text("APIs"),),
      ),
    );
  }
}