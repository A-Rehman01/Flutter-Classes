import 'package:flutter/material.dart';

import 'aboutus.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        customListTilte(),
        customListTilte(),
        customListTilte(),
      ],)
      );
    
  }
}

//Make Widget
//and ListTitle
Widget customListTilte (){
  return ListTile(
       leading: CircleAvatar(backgroundColor: Colors.black,radius: 20,),
       title: Text('ALi'),
       subtitle: Text('hay...'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          
          Text("4:00 PM"),
          // Text("11-11-2021"),
          
          CircleAvatar(backgroundColor: Colors.green,radius: 8,child: Text('2'),),
        ],
      )
    );
}


//NAvigation
// Center(
//         child: Container(
//           child: ElevatedButton(onPressed: (){
//             Navigator.push(context, 
//             MaterialPageRoute(builder: (context)=>About()));
//           }, child: Text('Goto About Page')),
//         ),
//       )

//Media Query
// Container(
//        color: Colors.red,
//       //  height: MediaQuery.of(context).size.height, bydefault 100% lelega
//       //  width:  MediaQuery.of(context).size.width,   bydefault 100% lelega
//        height: MediaQuery.of(context).size.height*0.5, //50%    0.2=>20%
//        width:  MediaQuery.of(context).size.width*0.5,   

//       )

//Stack 
// Stack(children: [
//         Positioned(
//           left: 20,
//           top: 20,
//           child: Container(height: 100,width: 100,color: Colors.black,)
//           ),
//         Align(
//           alignment: Alignment.topLeft,
//           child: Container(height: 100,width: 100,color: Colors.red,)
//           ),
       
//         Align(
//           alignment: Alignment.topRight,
//           child: Container(height: 100,width: 100,color: Colors.green,)
//           ),
//         Align(
//           alignment: Alignment.bottomLeft,

//           child: Container(height: 100,width: 100,color: Colors.yellow,
//           )),
//         Align(
//           alignment: Alignment.bottomRight,

//           child: Container(height: 100,width: 100,color: Colors.blue,)
//           ),
//       ],)


//CircularAvatar
//  Center(
//         child: CircleAvatar(
//           radius: 100,
//           // backgroundColor: Colors.brown,
//           // backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
//           backgroundImage: AssetImage('assets/bg.jpg')
//           ),
//       )

// TextDecoration
// Center(
//         child: Text('Text Decuration',
//         style: TextStyle(
//           color: Colors.blue[200],
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),),
//       )



// Container Decuration
//  Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//           // child: Center(child: Text('Flutter')),
//           // padding: EdgeInsets.all(20),
//           padding: EdgeInsets.only(left: 20,top: 20),
//           margin: EdgeInsets.only(top: 30),
//           child:  Text('Flutter'),
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//           // color: Colors.red,
//           color: Color(0xff32a852),
//           // gradient: LinearGradient(colors: [
//           //   Colors.purpleAccent,
//           //   Colors.red,
//           // ]),
//           borderRadius: BorderRadius.circular(10)
//           ),
//           )
//      )