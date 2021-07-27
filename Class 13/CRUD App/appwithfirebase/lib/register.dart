import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegister extends StatefulWidget {

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

   void register () async {
     FirebaseAuth auth = FirebaseAuth.instance;
     FirebaseFirestore db = FirebaseFirestore.instance;

     final String username = usernameController.text;
     final String email = emailController.text;
     final String password = passwordController.text;

    // print('this is register'+ username);
    try {
        UserCredential userCredential = await  auth.createUserWithEmailAndPassword(
          email: email,
          password: password
        );

        db.collection('users').doc(userCredential.user.uid).set({
          'username':username,
          'email':email
        });
        
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
  }
    return Scaffold(
      appBar: AppBar(title: Text('Registration'),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(child:
         Container(
           margin: EdgeInsets.only(top: 80),
          //  height: MediaQuery.of(context).size.height,
           child: SingleChildScrollView(
                        child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   margin: EdgeInsets.only(bottom: 40),
                   child: Text('SignUp Form',
                   style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blue[600]),)),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Username'
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Email'
                  ), 
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Password'
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 200,
                  height: 50,
                  child: ElevatedButton(onPressed: register,
                    child: Text('Submit',style: TextStyle(fontSize: 20),)
                    
                      )
                    )
        ],),
           ),
         ),),
      )
    );
  }
}