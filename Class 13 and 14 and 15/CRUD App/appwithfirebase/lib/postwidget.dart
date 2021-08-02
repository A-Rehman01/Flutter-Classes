import 'package:appwithfirebase/editPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PostWidget extends StatelessWidget {
  final Map data;
  PostWidget({this.data});

  @override
  Widget build(BuildContext context) {
    
    // print('data');
    // print(data['id']);
    void edit () {
        showDialog(context: context, builder: (BuildContext context){
        return EditPost(data:data);
        });
    }
    void delete () async {
      try{
      FirebaseFirestore db = FirebaseFirestore.instance;
      await   db.collection('posts').doc(data["id"]).delete();
        Fluttertoast.showToast(
        msg: "Post Delete SuccessFully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      }
      catch(e){
        print(e.message);
      }
    }
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
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 40,
                  child: ElevatedButton(onPressed: edit,
                    child: Text('Edit',style: TextStyle(fontSize: 18),)
                    
                      )
                    ), Container(
                   margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 40,
                  child: ElevatedButton(onPressed: delete,
                    child: Text('Delete',style: TextStyle(fontSize: 18),)
                    
                      )
                    ),
                  ],
                ),
          ],
          
          ),
        ),
      ),
    );
  }
}