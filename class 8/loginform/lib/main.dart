import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


//return Matarial APp Kraege
// or us me Home hoga 
// or Scaffold home me hoga jo ke html ke body ke tag ki tah hoga

// Container(
//           height: 200,
//           width: 200,
//           color: Colors.purple,
//           child: Text('heeloo') 
//           ,

// Colomun
//  Column(
//           children: [
//             Text('Col 1'),
//             SizedBox(height: 10,),
//             Text('Col 2'),
//             Text('Col 3'),
//             Text('Col 4'),
//             Text('Col 5'),
//         ] ),

//  Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//           Text('Row 1'),
//           Text('Row 2'),
//           Text('Row 3'),
//         ],)

// Scroll View
//  body: SingleChildScrollView(
//                   child: Center(
//                     child: Column(
//                       children: [],
//           ),
//           ),
//         )



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(title: Center(child: Text('Login Form')),),
       body: Center(
         
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
           SizedBox(height: 50,),
           Container(
             width: 200,
             child: TextField(
                decoration: InputDecoration(
                 hintText: 'Please Enter a Email'
               ),)),
               Container(
             width: 200,
             child: TextField(
               decoration: InputDecoration(
                 hintText: 'Please Enter a Password'
               ),
             )),
               SizedBox(height: 70,),
             Center(
               child: Container(
                 padding: const EdgeInsets.all(8.0),
                 height: 60,
                 width: 150,
                 child: ElevatedButton(onPressed: (){}, child: Text('Login')),
               ),
             )
         ],),
       ),
      ),
    );
  }
}