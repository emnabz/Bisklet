import 'package:flutter/material.dart';
import 'package:bisklet/app/sign_in/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bisklet',
    theme: ThemeData(
      primaryColor: Colors.grey[200],

    ),
    home: SplashScreen(),

    );
  }
}
