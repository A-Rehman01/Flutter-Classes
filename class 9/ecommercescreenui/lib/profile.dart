import 'package:flutter/material.dart';

import 'appbarwidget.dart';


class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBarWidget(),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              children: [
              Image.asset('assets/user.png',width: 110,),
               SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('User',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                Text('arehmana377@gmail.com',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text('logout',style: TextStyle(color: Colors.blue)),
              ],)
            ],),
          ),
          Container(
            margin: EdgeInsets.only(top: 50,bottom: 30),
            child: Text('Account Information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
           ),
           Container(
            //  color: Colors.red,
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Full Name',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('User',style: TextStyle(fontSize: 18)), 
               trailing:Image.network('data:image/png;base64,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',width: 30,)
             ),
           ),
            Container(
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Full Name',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('Abdul Rehman',style: TextStyle(fontSize: 18)), 
             ),
           ),
            Container(
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Email',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('arehmana377@gmial.com',style: TextStyle(fontSize: 18)), 
             ),
           ),
            Container(
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Phone',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('03460928846',style: TextStyle(fontSize: 18)), 
             ),
           ), Container(
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Address',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('1144/2 F B Area KArachi',style: TextStyle(fontSize: 18)), 
             ),
           ), Container(
             child: ListTile(
              //  contentPadding: EdgeInsets.zero,
               title: Text('Date-Of-Birth',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               subtitle: Text('20-02-1998',style: TextStyle(fontSize: 18)), 
             ),
           )
        ],),
      )
    );
  }
}
