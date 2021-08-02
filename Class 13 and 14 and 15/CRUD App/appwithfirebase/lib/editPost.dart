import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;


class EditPost extends StatefulWidget {
  final Map data;
  EditPost({this.data});

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
   String imagePath = '';
  final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
  
  @override
  void initState(){
    super.initState();
titleController.text=widget.data['title'];
descriptionController.text=widget.data['description'];
  }
  @override
  
  
  Widget build(BuildContext context) {
 
    void pickerHandler  () async {
       final ImagePicker _picker = ImagePicker();
        final  image = await _picker.getImage(source: ImageSource.gallery);
        setState(() async {
              imagePath = await image.path;
            });
        // print(image.path);
        }

  void submit () async {
    print(imagePath);
   try{
     firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
     FirebaseFirestore db = FirebaseFirestore.instance;

   String basename =  path.basename(imagePath);


  // firebase_storage.Reference ref =
  // firebase_storage.FirebaseStorage.instance.ref('/$basename');

  firebase_storage.Reference ref =
  firebase_storage.FirebaseStorage.instance.ref('/$basename');

  File file = new File(imagePath);
  await ref.putFile(file);
  String imageUrl= await ref.getDownloadURL();
     Map<String,dynamic> newPost = {
          "title" : titleController.text,
          "description" : descriptionController.text,
          "url":imageUrl,
        };
      await  db.collection('posts').doc(widget.data["id"]).set(newPost);
      Navigator.of(context).pop();
   print("Post Updated SuccessFully");
   Fluttertoast.showToast(
        msg: "Post Updated SuccessFully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
   }catch(e){
    //  print(e?.message);
    //  print(e.code);
     print(e);

   }
 }
    // void submit() async{
    //   try {
    //          FirebaseFirestore db = FirebaseFirestore.instance;
    //         String basename =  path.basename(imagePath);
    //         print(basename);
    //         firebase_storage.Reference ref =
    //         firebase_storage.FirebaseStorage.instance.ref('/$basename');
    //         File file = new File(imagePath);
    //         await ref.putFile(file);
    //         String imageUrl= await ref.getDownloadURL();
    //         print(imageUrl);
    //   //   Map<String,dynamic> newPost = {
    //   //     "title" : titleController.text,
    //   //     "description" : descriptionController.text,
    //   //     "url":imageUrl,
    //   //   };
    //   // await  db.collection('posts').doc(widget.data["id"]).set(newPost);
    //   Navigator.of(context).pop();
    //    Fluttertoast.showToast(
    //     msg: "Post Updated SuccessFully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    //   } catch (e) {
    //     print('error');
    //     print(e);
    //   }
    // }
    
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 40,
                  child: ElevatedButton(onPressed: pickerHandler,
                    child: Text('Pick an Image',style: TextStyle(fontSize: 14),)
                    
                      )
                    ), Container(
                   margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 40,
                  child: ElevatedButton(onPressed: submit,
                    child: Text('Submit',style: TextStyle(fontSize: 14),)
                    
                      )
                    ),
                  ],
                ),
          ],
        ),
      )
    );
  }
}