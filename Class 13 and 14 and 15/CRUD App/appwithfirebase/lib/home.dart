import 'dart:io';

import 'package:appwithfirebase/postwidget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
Stream postsStream = FirebaseFirestore.instance.collection('posts').snapshots();
 
      final TextEditingController titleController = TextEditingController();
      final TextEditingController descriptionController = TextEditingController();
      String imagePath ='';
  @override
 
  Widget build(BuildContext context) {
    void pickerHandler  () async {
       final ImagePicker _picker = ImagePicker();
    final  image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
          imagePath = image.path;
        });
 }
 void submit () async {
   if(titleController.text != '' || descriptionController.text != '' || imagePath != '' ){
   try{
     FirebaseFirestore db = FirebaseFirestore.instance;

   String title = titleController.text;
   String description = descriptionController.text;
  String basename =  path.basename(imagePath);


  firebase_storage.Reference ref =
  firebase_storage.FirebaseStorage.instance.ref('/$basename');
  File file = new File(imagePath);
  await ref.putFile(file);
  String imageUrl= await ref.getDownloadURL();
    db.collection('posts').add({
          'title':title,
          'description':description,
          "url":imageUrl
        });
  //  print(title);
  //  print(description);
   print("Post Uploaded SuccessFully");
  //  descriptionController.clear();
  //  titleController.clear();
  //  setState(() {
  //       imagePath='';
  //     });
   Fluttertoast.showToast(
        msg: "Post Uploaded SuccessFully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
   }catch(e){
     print(e?.message);
     print(e.code);
     print(e);

   }
   }else{
     Fluttertoast.showToast(
        msg: "Enter Data Carefully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
   }
 }
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Container(
        padding: EdgeInsets.all(10),
              child: Container(
          child: SafeArea(
            child:  Column(children: [
                  TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Title'
                  ), 
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Description'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 40,
                  child: ElevatedButton(onPressed: pickerHandler,
                    child: Text('Pick an Image',style: TextStyle(fontSize: 18),)
                    
                      )
                    ), Container(
                   margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 40,
                  child: ElevatedButton(onPressed: submit,
                    child: Text('Submit',style: TextStyle(fontSize: 18),)
                    
                      )
                    ),
                  ],
                ),
                
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: StreamBuilder<QuerySnapshot>(
                  stream: postsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return new ListView(
                      children: snapshot.data.docs.map((DocumentSnapshot document) {
                      Map data = document.data() ;
                      // print(data);
                      // print(document.id);
                      data['id'] =document.id;
                        return  PostWidget(data:data,);
                      }).toList(),
                    );
                  },
                ),
                ),
              )
            ],)

          ),
        ),
      ),
    );
  }
}