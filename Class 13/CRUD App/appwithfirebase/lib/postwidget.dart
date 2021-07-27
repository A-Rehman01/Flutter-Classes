import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {

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
            Image.network('https://freepngimg.com/thumb/spiderman/1-2-spider-man-download-png-thumb.png'
            ,width: 100,height: 100,),
          Text('Spiderman',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
          Text('Spider-Man has spider-like abilities including superhuman strength and the ability to cling to most surfaces.',style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,),
          ],
          
          ),
        ),
      ),
    );
  }
}