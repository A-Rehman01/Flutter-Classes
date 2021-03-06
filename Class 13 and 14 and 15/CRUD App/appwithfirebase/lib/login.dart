import 'package:appwithfirebase/register.dart';
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

        Navigator.of(context).pushNamed('/home',arguments: user);
      } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
          showDialog(context: context, builder: (BuildContext context){
          return customErrorHandling('No user found for that email.');
             });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
         showDialog(context: context, builder: (BuildContext context){
          return customErrorHandling('Wrong password provided for that user.');
             });
        print('Wrong password provided for that user.');
      }
      } 
       catch (e) {
        print('ERROR: '+ e.code);
           showDialog(context: context, builder: (BuildContext context){
          return customErrorHandling(e?.message);
             });
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
                SizedBox(height: 20,),
                Row(children: [
                Text('If not an Account?',style: TextStyle(fontSize: 17),),
                SizedBox(width: 2,),
                GestureDetector(child: Text('Sign Up',
                style: TextStyle(fontSize: 18,color: Colors.blue[300],fontWeight: FontWeight.bold))
                 ,onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new UserRegister())),),
                ],),
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


Widget customErrorHandling (msg) {

  return  AlertDialog(content: Text(msg),);

 
}