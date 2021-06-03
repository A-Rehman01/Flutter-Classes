import 'package:flutter/material.dart';


Widget AppBarWidget () {
  return AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        title: Center(child: Text('Ecom App UI',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
                ),
              )
            ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            color: Colors.black,
            onPressed: (){}
            )
        ]);
}