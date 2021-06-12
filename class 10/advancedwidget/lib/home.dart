import 'package:advancedwidget/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var text = '0';
  one () {
    setState(() {
      text = '1';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Value $text'),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: one, child: Text('Make  1')),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            setState(() {
              text='2';
             });
          },
           child: Text('Make2')),
        ],),
      ),
    );
  }
}






//Tabs BAr
// return DefaultTabController(length: 2, child: Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Home')),
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.white,
//         bottom: TabBar(
//         indicatorColor: Colors.white,
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.white,
//         tabs: [
//         Tab(child: Text('Login'),),
//         Tab(child: Text('Register'),),
//       ],),),
//       body: TabBarView(children: [
//         LoginPage(),
//         RegisterPage(),
//       ],),
//     ));


//Drawer
// Scaffold(
//       appBar: AppBar(title: Text('Drawer Exapmle'),),
//       drawer: Drawer(child: ListView(
//       children: [
//         DrawerHeader(child: Container(color: Colors.red,child: Text('Drawer HEader Like Image/Logo'))),
//         ListTile(title: Text('Screen1'),),
//         ListTile(title: Text('Screen2'),),
//         GestureDetector(child: ListTile(title: Text('Login')),onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                     builder: (BuildContext context) => new LoginPage())),),
//       ],
//     ),),
//     );

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