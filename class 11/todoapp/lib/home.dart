import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var output='';
  List<dynamic> lst = [1,2,3];
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(title: Text('Todos'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(color: Colors.grey[200],
              border: Border(left: BorderSide(color: Colors.grey,width: 10.0))
              ),
              margin: EdgeInsets.only(top: 10),
              child: (
                ListTile(
                  title: Text("${lst[index]}"),
                  trailing: Container(
                    width: 50,
                    // color: Colors.grey,
                    child: Row(
                        children: [ 
                      GestureDetector(onTap: (){ showDialog(context: context,builder:(context){
                      return AlertDialog(
                        title: Text('Edit Item'),
                        content: TextField(onChanged: (value){
                          output = value;
                        },),
                        actions: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                             lst.replaceRange(index, index+1, {output});
                            });
                            Navigator.pop(context);
                          }, child: Text('Edit'))
                        ],
                      );
                  },);
                      
                      },child: Icon(Icons.edit,)),

                        GestureDetector(onTap: (){
                        setState(() {
                          lst.removeAt(index);
                        });
                      },
                        child: Icon(Icons.delete,color: Colors.red,)),
                      
                    ],),
                  ),
                  )
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context,builder:(context){
            return AlertDialog(
              title: Text('Add Item'),
              content: TextField(onChanged: (value){
                output = value;
              },),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    lst.add(output);
                  });
                  Navigator.pop(context);
                }, child: Text('Add'))
              ],
            );
        },);
      },child: Text('+',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
    );
  }
}