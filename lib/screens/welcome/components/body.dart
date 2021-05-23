import 'package:besklet/screens/welcome/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Background(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
        "Welcome to Besklet", 
        style: TextStyle(fontWeight: FontWeight.bold)
        ),
        ],
  )
  );
  }  
}

