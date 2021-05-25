import 'package:bisklet/screens/welcome/components/background.dart' show Background;
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Background(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
        "Welcome to Bisklet",
        textAlign: TextAlign.center, 
        style: TextStyle(fontWeight: FontWeight.bold)
        ),
        ],
  )
  );
  }  
}

