import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> lst = [1,2,3,4,5,6,7,8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
        child: Container(
         padding: EdgeInsets.all(15),
         child: Column(
           children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Text('Items',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
             Text('View More',style: TextStyle(color: Colors.blue),),
           ],),
           Container(
             height: 250,
            //  width: MediaQuery.of(context).size.width*0.5,
             decoration: BoxDecoration(
                     boxShadow: [
                     new BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.2)
                     ),
                    ],
                    ),
            margin: EdgeInsets.only(top: 10),
             child: ListView.builder(
               shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
               itemBuilder: (context,index){
                 return Container(
                   margin: EdgeInsets.only(right: 10),
                   width: MediaQuery.of(context).size.width*0.9,
                  
                   child: Card(
                     elevation: 0,
                     margin: EdgeInsets.zero,
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                       Container(
                          //  alignment: Alignment.center,
                         child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                           child: Image.network('https://scontent.fkhi2-2.fna.fbcdn.net/v/t31.18172-0/s526x296/14324660_1700217250004591_5385896191358929197_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=9267fe&_nc_eui2=AeEvubqItIHB9p_Rw8SIdR5h1KJcT5P9_UDUolxPk_39QPxPdcOXEA8xUgzlFK3NkmK2nSJidcS8Mm1th9v4qmjg&_nc_ohc=XmImeVhwvBkAX8ADBM8&_nc_ht=scontent.fkhi2-2.fna&tp=7&oh=44f00b497246b6d06fcc95b4b8c3020e&oe=60F52F30',
                              fit: BoxFit.fill,
                              height: 180,
                              width: MediaQuery.of(context).size.width,

                            )
                           ),
                       ),
                       SizedBox(height: 13,),
                       Text('The Jungle Book',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Icon(Icons.star_rate,color: Colors.yellow,),
                         Icon(Icons.star_rate,color: Colors.yellow,),
                         Icon(Icons.star_rate,color: Colors.yellow,),
                         Text('5.0 '),
                         Text('(23 Reviews)'),
                      ],)
                     ],),
                   )
                 );
               }
               ),
           ),
           Container(
             alignment: Alignment.topLeft,
             child: Text('More Category',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
             margin: EdgeInsets.only(top: 15),


             ),
           Container(
             height: 90,
               margin: EdgeInsets.only(top: 5),
               child: ListView.builder(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemCount: 5,
                 itemBuilder: (context,index){
                   return smallCards(context);
                 }
                 ),
           ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Text('Popular Items',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21),),
               Text('View More',style: TextStyle(color: Colors.blue),),
           ],),
            ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: GridView.count(
            shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(lst.length, (index) => (
                    bottomCard(context)
                  ))
            
            ),
        )
         ],),
       ),
     ),
    );
  }
}

Widget smallCards (var context){
  return (
    Card(
      elevation: 1,
      child: Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
      //  crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       Icon(Icons.movie_filter,color: Colors.purple,size: 35,),
       SizedBox(width: 10,),
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Text('Electronics',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         Text('22 items')
       ],)
     ],), 
    ),)
  );
}


Widget bottomCard (var context) {
  return Card(
      child: (
      Container(
        height: 170,
        // color: Colors.red,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                //  alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network('https://scontent.fkhi2-2.fna.fbcdn.net/v/t31.18172-0/s526x296/14324660_1700217250004591_5385896191358929197_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=9267fe&_nc_eui2=AeEvubqItIHB9p_Rw8SIdR5h1KJcT5P9_UDUolxPk_39QPxPdcOXEA8xUgzlFK3NkmK2nSJidcS8Mm1th9v4qmjg&_nc_ohc=XmImeVhwvBkAX8ADBM8&_nc_ht=scontent.fkhi2-2.fna&tp=7&oh=44f00b497246b6d06fcc95b4b8c3020e&oe=60F52F30',
                    fit: BoxFit.fill,
                    height: 90,
                    width: MediaQuery.of(context).size.width,

                  )
                  ),
              ),
              SizedBox(height: 13,),
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,child: Text('The Jungle Book',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Icon(Icons.star_rate,color: Colors.yellow,size: 13,),
                  Icon(Icons.star_rate,color: Colors.yellow,size: 13),
                  Icon(Icons.star_rate,color: Colors.yellow,size: 13),
                  Text('5.0 ',style: TextStyle(fontSize: 10,),),
                  Text('(23 Reviews)',style: TextStyle(fontSize: 10,),),
            ],),
              ),
              SizedBox(height: 10,),
            ],),
      )
    ),
  );
}