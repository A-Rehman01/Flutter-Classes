import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var lst=['Ali','Ahmed','Asma','alishba'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('yoo')
    );
  }
}


// GridView
// GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: 50,
//         mainAxisSpacing: 50,
//         children: List.generate(lst.length, (index) {
//           return  Container(
//             child: Text(lst[index]),
//             color: Colors.yellow,
//             );
//         }),
//         )

// ListView.Builder
// ListView.builder(
//         itemCount: lst.length,
//         itemBuilder: (context,index){
//         return ListTile(
//           title: Text(lst[index]), 
//           subtitle: Text(age[index]),
//           );
//       })


// ListView
// return Scaffold(
//       body: ListView(
//         children: [
//           customView('12'),
//           customView('21')
//         ],
//       ),
// Widget customView (var name){
//   return Container(
//             height: 100,
//             color: Colors.yellow,
//             child: Row(children: [
//               Container(
//                 color: Colors.red,
//                 height:  90,
//                 width: 100,
//                 child: Center(child: Text(name)),
//                 )
//             ],),
//             );
// }