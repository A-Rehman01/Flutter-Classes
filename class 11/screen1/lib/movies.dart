import 'package:flutter/material.dart';
import 'package:screen1/cart.dart';
import 'package:screen1/favourite.dart';
import 'package:screen1/home.dart';
import 'package:screen1/profile.dart';

class Movies extends StatefulWidget {

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

   int currentTab = 0;

  Widget currentScreen = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
        bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        color: Colors.grey[200],
        child: Container(
         decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[400]))),
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentTab = 0;
                      });
                    },
                    child: Icon(Icons.home,
                        color: currentTab == 0 ? Colors.purple : Colors.grey)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Favourite();
                        currentTab = 1;
                      });
                    },
                    child: Icon(Icons.favorite,
                        color: currentTab == 1 ? Colors.purple : Colors.grey)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Cart();
                        currentTab = 2;
                      });
                    },
                    child: Icon(Icons.card_giftcard_outlined,
                        color: currentTab == 2 ? Colors.purple : Colors.grey)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 3;
                      });
                    },
                    child: Icon(Icons.person,
                        color: currentTab == 3 ? Colors.purple : Colors.grey)),
              ]),
          ), 
        ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){},
        tooltip: '',
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 26,
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          
    );
  }
}