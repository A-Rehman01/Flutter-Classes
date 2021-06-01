import 'package:flutter/material.dart';

import 'home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
      Container(
        child: Text('Welcome to About Page',style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
      // ElevatedButton(onPressed: (){
      //       Navigator.push(context, 
      //       MaterialPageRoute(builder: (context)=>Home()));
      //     }, child: Text('Goto Home Page')),
      
      ElevatedButton(onPressed: (){    //simpleBack ke liye
            Navigator.pop(context);
          }, child: Text('Goto Back')),
      
      ],),
      
    );
  }
}