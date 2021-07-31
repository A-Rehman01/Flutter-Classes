import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Map data;
  PostWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all( 10),
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(border: Border.all(
      color: Colors.grey,
      width: 1,
    ),
     borderRadius: BorderRadius.circular(10),
 
    ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.network(data["url"]
            ,width: 100,height: 100,),
          Text(data['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
          Text(data["description"],style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,),
          ],
          
          ),
        ),
      ),
    );
  }
}