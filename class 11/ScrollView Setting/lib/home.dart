import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic>  lst = [1,2,3,4,5,6,7,8];  //Mtlab Integer or String Donon Hosakte he
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll View"),),
      body: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 30),          
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(lst.length, (index) => (
                    Container(
                      color: Colors.yellow,
                      child: Center(child: Text("${lst[index]}")),
                    )
                  ))
              ,)
           ],),
      ),
    );
  }
}


// Coloumn with ListView
// SingleChildScrollView(
//             child: Column(children: [
//                 ListView(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics( ),
//                   children: [
//                   Container(
//                     color: Colors.red,
//                     height: 200,
//                     margin: EdgeInsets.only(top: 30),
//                   ),
//                   Container(
//                     color: Colors.red,
//                     height: 200,
//                     margin: EdgeInsets.only(top: 30),
//                   ),
//                   Container(
//                     color: Colors.red,
//                     height: 200,
//                     margin: EdgeInsets.only(top: 30),
//                   ),
//                   Container(
//                     color: Colors.red,
//                     height: 200,
//                     margin: EdgeInsets.only(top: 30),
//                   ),
//                 ],)
//            ],),
//       ),









// SingleChildScrollView
//  return Scaffold(
//       body: SingleChildScrollView(
//               child: Column(children: [
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//           Container(
//             color: Colors.red,
//             height: 200,
//             width: 200,
//             margin: EdgeInsets.only(top: 30),          
//           ),
//         ],),
//       ),
//     );