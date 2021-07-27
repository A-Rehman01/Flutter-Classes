import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLogin extends StatefulWidget {

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

   void login () async {
     FirebaseAuth auth = FirebaseAuth.instance;
     FirebaseFirestore db = FirebaseFirestore.instance;

     final String email = emailController.text;
     final String password = passwordController.text;

    // print('this is register'+ username);
    try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
        );
       final DocumentSnapshot snapshot= await db.collection('users').doc(userCredential.user.uid).get();
       final user= snapshot.data();        
        emailController.clear();
        passwordController.clear();
        print('User Login in Successfully');
        print(user["username"]);
        print(user["email"]);

        Navigator.of(context).pushNamed('/home');
      } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      } 
       catch (e) {
        print('ERROR: '+ e.code);
      }
  }
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
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
                   child: Text('SignIn Form',
                   style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blue[600]),)),
             
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
                  child: ElevatedButton(onPressed: login,
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