import 'package:appwithfirebase/postwidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: SingleChildScrollView(
              child: Container(
          child: SafeArea(child: Column(children: [
            PostWidget(),
            PostWidget(),
            PostWidget()
          ],),),
        ),
      ),
    );
  }
}