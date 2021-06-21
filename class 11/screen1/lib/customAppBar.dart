import 'package:flutter/material.dart';


Widget AppBarWidget (var text) {
  return AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(text,
            style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
                  ),
                ),
          )
            ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              color: Colors.purple,
              onPressed: (){}
              ),
          )
        ]
        );
}