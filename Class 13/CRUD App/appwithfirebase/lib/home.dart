import 'package:appwithfirebase/postwidget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
Stream postsStream = FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Container(
              child: Container(
          child: SafeArea(
            child:  StreamBuilder<QuerySnapshot>(
      stream: postsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
          Map data = document.data() ;
          // print(data);
            return  PostWidget(data:data,);
          }).toList(),
        );
      },
    ),

          ),
        ),
      ),
    );
  }
}