import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class APIINTEGERATION extends StatefulWidget {

  @override
  _APIINTEGERATIONState createState() => _APIINTEGERATIONState();
}

class _APIINTEGERATIONState extends State<APIINTEGERATION> {

  getdata() async{
    var users = [];
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonRes = jsonDecode(response.body);
    print(jsonRes);
    for(var i in jsonRes){
      UserModel user = UserModel(i['name'],i['email'],i['company']['name']);
      users.add(user);
    }
   return users;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdata(),
        builder: (context,snapshot){
          if(snapshot.data == null){
            return Container(
            child: Text("Empty Data"),              
            );
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,i){
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: (
                    ListTile(
                      title: Text(snapshot.data[i].name),
                      // subtitle: Text(snapshot.data[i].email),
                      subtitle: Text(snapshot.data[i].company)
                      )
                  ),
                  
                );
              },
            );
          }
        },
      ),
    );
  }
}

class UserModel{
  var name;
  var email;
  var company;
  UserModel(this.name,this.email,this.company);
}

// Center(child: ElevatedButton(onPressed: getdata ,child: Text("Call APi"),)),