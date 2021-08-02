import 'package:appwithfirebase/login.dart';
import 'package:appwithfirebase/register.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //async
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
  return  FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Auth Firebase',
            home: Scaffold(
              body: Home(),
            ),
            routes: {
              '/home':(context)=> Home(),
              '/login':(context)=> UserLogin(),
              '/register':(context)=> UserRegister(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return  Container();
      },
    );
   
  }
}